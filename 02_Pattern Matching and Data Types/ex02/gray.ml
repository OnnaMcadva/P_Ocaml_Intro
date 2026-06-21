let gray n =
  let rec gen_gray n =
    if n = 0 then [""]
    else
      let prev = gen_gray (n - 1) in
      let left = List.map (fun s -> "0" ^ s) prev in
      let right = List.map (fun s -> "1" ^ s) (List.rev prev) in
      left @ right
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
