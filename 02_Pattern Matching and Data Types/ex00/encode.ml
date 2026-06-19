let encode lst =
  let rec aux lst cur count acc =
    match lst with
    | [] -> List.rev ((count, cur) :: acc)
    | h :: t ->
      if h = cur then aux t cur (count + 1) acc
      else aux t h 1 ((count, cur) :: acc)
  in
  match lst with
  | [] -> []
  | h :: t -> aux t h 1 []

let () =
  let result = encode ['a'; 'a'; 'a'; 'b'; 'b'; 'c'] in
  List.iter (fun (n, c) -> Printf.printf "(%d, %c) " n c) result;
  print_char '\n';
  let result2 = encode [1; 1; 2; 3; 3; 3] in
  List.iter (fun (n, x) -> Printf.printf "(%d, %d) " n x) result2;
  print_char '\n';
  let result3 = encode ([] : int list) in
  Printf.printf "empty: %d elements\n" (List.length result3)
