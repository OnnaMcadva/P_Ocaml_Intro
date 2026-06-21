let crossover lst1 lst2 =
  let rec mem x lst =
    match lst with
    | [] -> false
    | h :: t -> h = x || mem x t
  in
  let rec my_rev lst acc =
    match lst with
    | [] -> acc
    | h :: t -> my_rev t (h :: acc)
  in
  let rec aux lst1 acc =
    match lst1 with
    | [] -> my_rev acc []
    | h :: t ->
      if mem h lst2 then aux t (h :: acc)
      else aux t acc
  in
  aux lst1 []

let () =
  let r1 = crossover [1; 2; 3; 4] [2; 4; 6] in
  let r2 = crossover ['a'; 'b'; 'c'] ['b'; 'c'; 'd'] in
  let r3 = crossover [] [1; 2; 3] in
  let rec print_ints = function
    | [] -> print_char '\n'
    | h :: t -> Printf.printf "%d " h; print_ints t
  in
  let rec print_chars = function
    | [] -> print_char '\n'
    | h :: t -> Printf.printf "%c " h; print_chars t
  in
  let rec my_length = function
    | [] -> 0
    | _ :: t -> 1 + my_length t
  in
  print_ints r1;
  print_chars r2;
  Printf.printf "empty: %d elements\n" (my_length r3)
