let rec ackermann m n =
  if m < 0 || n < 0 then -1
  else if m = 0 then n + 1
  else if n = 0 then ackermann (m - 1) 1
  else ackermann (m - 1) (ackermann m (n - 1))

let () =
  Printf.printf "%d\n" (ackermann 2 (-2));
  Printf.printf "%d\n" (ackermann (-1) 7);
  Printf.printf "%d\n" (ackermann 0 0);
  Printf.printf "%d\n" (ackermann 1 1);
  Printf.printf "%d\n" (ackermann 2 2);
  Printf.printf "%d\n" (ackermann 3 3);
  Printf.printf "%d\n" (ackermann 2 3);
  Printf.printf "%d\n" (ackermann 3 4);
  Printf.printf "%d\n" (ackermann 4 1);
  Printf.printf "%d\n" (ackermann 0 2);
  Printf.printf "%d\n" (ackermann 1 0)
