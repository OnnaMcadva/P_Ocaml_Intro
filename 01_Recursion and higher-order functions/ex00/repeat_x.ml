let rec repeat_x n =
  if n < 0 then "Error"
  else if n = 0 then ""
  else "x" ^ repeat_x (n - 1)

let () =
  Printf.printf "%s\n" (repeat_x (-1));
  Printf.printf "%s\n" (repeat_x 0);
  Printf.printf "%s\n" (repeat_x 1);
  Printf.printf "%s\n" (repeat_x 2);
  Printf.printf "%s\n" (repeat_x 5)
