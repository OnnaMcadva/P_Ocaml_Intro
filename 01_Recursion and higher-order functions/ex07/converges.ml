let rec converges f x n =
  if n < 0 then false
  else if f x = x then true
  else if n = 0 then false
  else converges f (f x) (n - 1)

let () =
  Printf.printf "%b\n" (converges (( * ) 2) 2 5);
  Printf.printf "%b\n" (converges (fun x -> x / 2) 2 3);
  Printf.printf "%b\n" (converges (fun x -> x / 2) 2 2)
