let eu_dist (a : float array) (b : float array) : float =
  let sum = ref 0.0 in
  for i = 0 to Array.length a - 1 do
    let diff = a.(i) -. b.(i) in
    sum := !sum +. (diff *. diff)
  done;
  sqrt !sum

let () =
  let p1 = [|1.0; 2.0; 3.0|] in
  let p2 = [|4.0; 5.0; 6.0|] in

  Printf.printf "Distance: %f\n" (eu_dist p1 p2)
