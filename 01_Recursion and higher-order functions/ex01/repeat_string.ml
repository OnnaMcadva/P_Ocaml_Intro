let rec repeat_string ?(str = "x") n =
  if n < 0 then "Error"
  else if n = 0 then ""
  else str ^ repeat_string ~str (n - 1)

let () =
  Printf.printf "%s\n" (repeat_string (-1));
  Printf.printf "%s\n" (repeat_string 0);
  Printf.printf "%s\n" (repeat_string ~str:"Toto" 1);
  Printf.printf "%s\n" (repeat_string 2);
  Printf.printf "%s\n" (repeat_string ~str:"a" 5);
  Printf.printf "%s\n" (repeat_string ~str:"what" 3)
