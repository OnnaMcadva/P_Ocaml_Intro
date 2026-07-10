type radar = float array * string

let eu_dist a b =
  let sum = ref 0.0 in
  for i = 0 to Array.length a - 1 do
    let diff = a.(i) -. b.(i) in
    sum := !sum +. (diff *. diff)
  done;
  sqrt !sum

let one_nn (database : radar list) (target : radar) : string =
  match database with
  | [] -> invalid_arg "Database is empty"
  | first :: rest ->
      let target_vector, _ = target in
      
      let _, best_class = List.fold_left (fun (min_dist, current_best_class) (db_vector, db_class) ->
        let dist = eu_dist target_vector db_vector in
        if dist < min_dist then
          (dist, db_class)
        else
          (min_dist, current_best_class)
      ) (eu_dist target_vector (fst first), snd first) rest
      in
      best_class

let () =
  let database = [
    ([|1.0; 1.0|], "Good");
    ([|9.0; 9.0|], "Bad")
  ] in
  let target1 = ([|1.5; 1.2|], "") in 
  let target2 = ([|8.5; 9.1|], "") in 

  Printf.printf "Target 1 predicted class: %s\n" (one_nn database target1);
  Printf.printf "Target 2 predicted class: %s\n" (one_nn database target2)
