let rec iter f x n =
  if n < 0 then -1
  else if n = 0 then x
  else iter f (f x) (n - 1)

let () =
  Printf.printf "%d\n" (iter (fun x -> x * x) 2 4);
  Printf.printf "%d\n" (iter (fun x -> x * 2) 2 4);
  Printf.printf "%d\n" (iter (fun x -> x + 1) 0 10)
