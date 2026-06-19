let fibonacci n =
  let rec aux n a b =
    if n = 0 then a
    else aux (n - 1) b (a + b)
  in
  if n < 0 then -1
  else aux n 0 1

let () =
  Printf.printf "%d\n" (fibonacci (-42));
  Printf.printf "%d\n" (fibonacci 0);
  Printf.printf "%d\n" (fibonacci 1);
  Printf.printf "%d\n" (fibonacci 3);
  Printf.printf "%d\n" (fibonacci 6);
  Printf.printf "%d\n" (fibonacci 10)
