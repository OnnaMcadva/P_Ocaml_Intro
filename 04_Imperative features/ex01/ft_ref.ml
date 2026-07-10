type 'a ft_ref = { mutable contents : 'a }

let return x = { contents = x }

let get r = r.contents

let set r new_value = r.contents <- new_value

let bind r f = f r.contents

let () =
  print_endline "--- Testing ft_ref ---";
  let r = return 42 in
  Printf.printf "Initial value: %d\n" (get r);
  
  set r 100;
  Printf.printf "After set: %d\n" (get r);

  let r2 = bind r (fun value -> return (value + 50)) in
  Printf.printf "After bind: %d\n" (get r2)