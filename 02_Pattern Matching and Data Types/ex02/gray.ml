let gray n =
  let rec my_rev lst acc =
    match lst with
    | [] -> acc
    | h :: t -> my_rev t (h :: acc)
  in
  let rec append l1 l2 =
    match l1 with
    | [] -> l2
    | h :: t -> h :: append t l2
  in
  let rec gen_gray n =
    if n = 0 then [""]
    else
      let prev = gen_gray (n - 1) in
      let left = List.map (fun s -> "0" ^ s) prev in
      let right = List.map (fun s -> "1" ^ s) (my_rev prev []) in
      append left right
  in
  let codes = gen_gray n in
  let rec print_codes = function
    | [] -> ()
    | [x] -> print_string x
    | x :: t -> print_string x; print_char ' '; print_codes t
  in
  print_codes codes;
  print_char '\n'

let () =
  gray 1;
  gray 2;
  gray 3
  