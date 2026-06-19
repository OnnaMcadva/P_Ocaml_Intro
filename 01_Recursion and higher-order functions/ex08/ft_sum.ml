let ft_sum f lo hi =
  let rec aux i acc =
    if i > hi then acc
    else aux (i + 1) (acc +. f i)
  in
  if hi < lo then nan
  else aux lo 0.0

let () =
  Printf.printf "%f\n" (ft_sum (fun i -> float_of_int (i * i)) 1 10);
  Printf.printf "%f\n" (ft_sum (fun i -> float_of_int i) 1 5);
  Printf.printf "%f\n" (ft_sum (fun i -> float_of_int i) 5 1)
