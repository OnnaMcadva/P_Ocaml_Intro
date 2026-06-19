let rec ft_power base exp =
  if exp = 0 then 1
  else base * ft_power base (exp - 1)

let () =
  Printf.printf "%d\n" (ft_power 2 4);
  Printf.printf "%d\n" (ft_power 3 0);
  Printf.printf "%d\n" (ft_power 0 5)
