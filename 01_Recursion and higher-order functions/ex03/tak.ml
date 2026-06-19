let rec tak x y z =
  if y < x then tak (tak (x - 1) y z) (tak (y - 1) z x) (tak (z - 1) x y)
  else z

let () =
  Printf.printf "%d\n" (tak 1 2 3);
  Printf.printf "%d\n" (tak 5 23 7);
  Printf.printf "%d\n" (tak 9 1 0);
  Printf.printf "%d\n" (tak 1 1 1);
  Printf.printf "%d\n" (tak 0 42 0);
  Printf.printf "%d\n" (tak 23498 98734 98776)
