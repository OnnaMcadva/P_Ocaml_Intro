let encode lst =
  let rec my_rev lst acc =
    match lst with
    | [] -> acc
    | h :: t -> my_rev t (h :: acc)
  in
  let rec aux lst cur count acc =
    match lst with
    | [] -> my_rev ((count, cur) :: acc) []
    | h :: t ->
      if h = cur then aux t cur (count + 1) acc
      else aux t h 1 ((count, cur) :: acc)
  in
  match lst with
  | [] -> []
  | h :: t -> aux t h 1 []

let () =
  let result0 = encode ["ku"; "ku"; "ku"; "ka"; "ka"; "ku"] in
  List.iter (fun (n, c) -> Printf.printf "(%d, %s) " n c) result0;
  print_char '\n';
  let result1 = encode ['a'; 'a'; 'a'; 'b'; 'b'; 'c'] in
  List.iter (fun (n, c) -> Printf.printf "(%d, %c) " n c) result1;
  print_char '\n';
  let result2 = encode [1; 1; 2; 3; 3; 3] in
  List.iter (fun (n, x) -> Printf.printf "(%d, %d) " n x) result2;
  print_char '\n';
  let result3 = encode ([] : int list) in
  Printf.printf "empty: %d elements\n" (List.length result3);
  let result4 = encode [(3, 2); (3, 2); (4, 3)] in
  List.iter (fun (n, (a, b)) -> Printf.printf "(%d, (%d, %d)) " n a b) result4;
  print_char '\n';
