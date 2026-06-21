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
  let result = encode ['a'; 'a'; 'a'; 'b'; 'b'; 'c'] in
  let rec print_pairs = function
    | [] -> print_char '\n'
    | (n, c) :: t -> Printf.printf "(%d, %c) " n c; print_pairs t
  in
  print_pairs result;
  let result2 = encode [1; 1; 2; 3; 3; 3] in
  let rec print_int_pairs = function
    | [] -> print_char '\n'
    | (n, x) :: t -> Printf.printf "(%d, %d) " n x; print_int_pairs t
  in
  print_int_pairs result2;
  let result3 = encode ([] : int list) in
  let rec my_length = function
    | [] -> 0
    | _ :: t -> 1 + my_length t
  in
  Printf.printf "empty: %d elements\n" (my_length result3)
