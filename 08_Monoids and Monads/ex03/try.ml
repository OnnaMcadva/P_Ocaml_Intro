module Try = struct
  type 'a t =
    | Success of 'a
    | Failure of exn

  let return (x : 'a) : 'a t = Success x

  let bind (m : 'a t) (f : 'a -> 'b t) : 'b t =
    match m with
    | Failure e -> Failure e
    | Success v ->
        try f v with
        | e -> Failure e

  let recover (m : 'a t) (f : exn -> 'a t) : 'a t =
    match m with
    | Success v -> Success v
    | Failure e ->
        try f e with
        | err -> Failure err

  let filter (m : 'a t) (p : 'a -> bool) : 'a t =
    match m with
    | Failure e -> Failure e
    | Success v ->
        try
          if p v then Success v
          else Failure (Invalid_argument "Predicate failed")
        with
        | e -> Failure e

  let flatten (m : 'a t t) : 'a t =
    match m with
    | Failure e -> Failure e
    | Success (Success v) -> Success v
    | Success (Failure e) -> Failure e
end

let () =
  let divide x y =
    if y = 0 then failwith "Division by zero"
    else Try.return (x / y)
  in

  let test1 = Try.bind (Try.return 10) (fun x -> divide x 2) in
  let test2 = Try.bind (Try.return 10) (fun x -> divide x 0) in

  (match test1 with
   | Try.Success v -> Printf.printf "Test 1 Success: %d\n" v
   | Try.Failure _ -> print_endline "Test 1 Failed");

  (match test2 with
   | Try.Success _ -> print_endline "Test 2 Success"
   | Try.Failure e -> Printf.printf "Test 2 Failed with: %s\n" (Printexc.to_string e));

  let recovered = Try.recover test2 (fun _ -> Try.return 42) in
  (match recovered with
   | Try.Success v -> Printf.printf "Recovered value: %d\n" v
   | Try.Failure _ -> print_endline "Failed to recover");

  let filtered = Try.filter (Try.return 100) (fun x -> x > 50) in
  let filtered_fail = Try.filter (Try.return 10) (fun x -> x > 50) in

  Printf.printf "Filtered (100 > 50) is Success? %b\n"
    (match filtered with Try.Success _ -> true | _ -> false);
  Printf.printf "Filtered (10 > 50) is Success? %b\n"
    (match filtered_fail with Try.Success _ -> true | _ -> false)
