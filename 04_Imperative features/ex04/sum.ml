let sum (a : float) (b : float) : float = a +. b

let () =
  Printf.printf "Sum of 2.5 and 4.3 is: %f\n" (sum 2.5 4.3);
  Printf.printf "Sum of -1.0 and 1.0 is: %f\n" (sum (-1.0) 1.0)
