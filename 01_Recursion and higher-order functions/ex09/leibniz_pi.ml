let leibniz_pi delta =
  let pi = 4.0 *. atan 1.0 in
  let rec aux i acc =
    let term = (if i mod 2 = 0 then 1.0 else -1.0) /. float_of_int (2 * i + 1) in
    let value = 4.0 *. (acc +. term) in
    if abs_float (value -. pi) <= delta then i + 1
    else aux (i + 1) (acc +. term)
  in
  if delta < 0.0 then -1
  else aux 0 0.0

let () =
  Printf.printf "%d\n" (leibniz_pi (-1.0));
  Printf.printf "%d\n" (leibniz_pi 0.1);
  Printf.printf "%d\n" (leibniz_pi 0.01);
  Printf.printf "%d\n" (leibniz_pi 0.001)
