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
  List.iter (fun x -> Printf.printf "%d " x) r1;
  print_char '\n';
  let r2 = crossover ['a'; 'b'; 'c'] ['b'; 'c'; 'd'] in
  List.iter (fun x -> Printf.printf "%c " x) r2;
  print_char '\n';
  let r3 = crossover [] [1; 2; 3] in
  Printf.printf "empty: %d elements\n" (List.length r3)
