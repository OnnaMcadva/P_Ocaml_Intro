module Set = struct
  type 'a t = 'a list

  let return (x : 'a) : 'a t = [x]

  let rec remove_duplicates (lst : 'a list) : 'a list =
    match lst with
    | [] -> []
    | head :: tail ->
        let filtered_tail = List.filter (fun x -> x <> head) tail in
        head :: (remove_duplicates filtered_tail)

  let union (s1 : 'a t) (s2 : 'a t) : 'a t =
    remove_duplicates (s1 @ s2)

  let inter (s1 : 'a t) (s2 : 'a t) : 'a t =
    remove_duplicates (List.filter (fun x -> List.mem x s2) s1)

  let diff (s1 : 'a t) (s2 : 'a t) : 'a t =
    remove_duplicates (List.filter (fun x -> not (List.mem x s2)) s1)

  let bind (s : 'a t) (f : 'a -> 'b t) : 'b t =
    let mapped = List.map f s in
    remove_duplicates (List.flatten mapped)

  let filter (s : 'a t) (p : 'a -> bool) : 'a t =
    remove_duplicates (List.filter p s)

  let foreach (s : 'a t) (f : 'a -> unit) : unit =
    List.iter f s

  let for_all (s : 'a t) (p : 'a -> bool) : bool =
    List.for_all p s

  let exists (s : 'a t) (p : 'a -> bool) : bool =
    List.exists p s
end

let () =
  let s1 = [1; 2; 3; 4] in
  let s2 = [3; 4; 5; 6] in

  print_string "Union: ";
  Set.foreach (Set.union s1 s2) (fun x -> Printf.printf "%d " x);
  print_endline "";

  print_string "Intersection: ";
  Set.foreach (Set.inter s1 s2) (fun x -> Printf.printf "%d " x);
  print_endline "";

  print_string "Difference (s1 - s2): ";
  Set.foreach (Set.diff s1 s2) (fun x -> Printf.printf "%d " x);
  print_endline "";

  let bound = Set.bind s1 (fun x -> [x; x * 10]) in
  print_string "Bind (x and x*10): ";
  Set.foreach bound (fun x -> Printf.printf "%d " x);
  print_endline "";

  Printf.printf "For all elements > 0 in s1? %b\n" (Set.for_all s1 (fun x -> x > 0));
  Printf.printf "Exists element > 5 in s1? %b\n" (Set.exists s1 (fun x -> x > 5))
