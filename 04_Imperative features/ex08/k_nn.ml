type radar = float array * string

let eu_dist a b =
  let sum = ref 0.0 in
  for i = 0 to Array.length a - 1 do
    let diff = a.(i) -. b.(i) in
    sum := !sum +. (diff *. diff)
  done;
  sqrt !sum

let get_most_frequent_class classes =
  let rec count_occurrences acc = function
    | [] -> acc
    | x :: xs ->
        let count = try List.assoc x acc with Not_found -> 0 in
        let new_acc = (x, count + 1) :: (List.remove_assoc x acc) in
        count_occurrences new_acc xs
  in
  let counts = count_occurrences [] classes in
  let best_class, _ = List.fold_left (fun (best_c, max_cnt) (c, cnt) ->
    if cnt > max_cnt then (c, cnt) else (best_c, max_cnt)
  ) ("", -1) counts in
  best_class

let k_nn (database : radar list) (k : int) (target : radar) : string =
  if k <= 0 || List.length database < k then
    invalid_arg "Invalid K or database too small"
  else
    let target_vector, _ = target in
    let distances = List.map (fun (db_vector, db_class) ->
      (eu_dist target_vector db_vector, db_class)
    ) database in
    let sorted = List.sort (fun (d1, _) (d2, _) -> compare d1 d2) distances in
    let rec take n acc = function
      | [] -> List.rev acc
      | _ when n <= 0 -> List.rev acc
      | x :: xs -> take (n - 1) (x :: acc) xs
    in
    let k_neighbors = take k [] sorted in
    let neighbor_classes = List.map snd k_neighbors in
    get_most_frequent_class neighbor_classes

(* --- examples_of_file (as in ex06), needed here to load the real CSV files --- *)
let split_by_comma str =
  String.split_on_char ',' str

let parse_vector list =
  let numeric_parts = List.rev (List.tl (List.rev list)) in
  Array.of_list (List.map float_of_string numeric_parts)

let parse_class list =
  List.hd (List.rev list)

let parse_line line =
  let parts = split_by_comma line in
  (parse_vector parts, parse_class parts)

let examples_of_file filename =
  let chan = open_in filename in
  let lines = ref [] in
  (try
     while true do
       let line = input_line chan in
       if String.length (String.trim line) > 0 then
         lines := parse_line line :: !lines
     done
   with End_of_file -> ());
  close_in chan;
  List.rev !lines

let () =
  let database = [
    ([|1.0; 1.0|], "A");
    ([|1.1; 0.9|], "A");
    ([|5.0; 5.0|], "B");
    ([|5.2; 4.8|], "B");
    ([|5.1; 5.1|], "B")
  ] in
  let target = ([|4.5; 4.5|], "") in
  Printf.printf "K-NN predicted class (K=3): %s\n" (k_nn database 3 target);

  let tie_database = [
    ([|1.0; 1.0|], "A");
    ([|1.1; 0.9|], "A");
    ([|1.2; 1.1|], "B");
    ([|1.0; 1.2|], "B")
  ] in
  let tie_target = ([|1.1; 1.0|], "") in
  Printf.printf "K-NN predicted class (K=4, tie case): %s\n"
    (k_nn tie_database 4 tie_target);

  let train_file = "ionosphere.train.csv" in
  let test_file = "ionosphere.test.csv" in
  if Sys.file_exists train_file && Sys.file_exists test_file then begin
    let train_set = examples_of_file train_file in
    let test_set = examples_of_file test_file in
    let k = 5 in
    let correct = List.fold_left (fun acc (vector, true_class) ->
      let predicted = k_nn train_set k (vector, true_class) in
      if predicted = true_class then acc + 1 else acc
    ) 0 test_set in
    let total = List.length test_set in
    let accuracy = 100.0 *. (float_of_int correct) /. (float_of_int total) in
    Printf.printf "\n--- Accuracy on ionosphere test set (K=%d) ---\n" k;
    Printf.printf "Correct: %d / %d\n" correct total;
    Printf.printf "Accuracy: %.2f%%\n" accuracy
  end else
    Printf.printf "\n(Skipping accuracy test: ionosphere csv files not found in this directory)\n"
  