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
  let rec loop acc =
    try
      let line = input_line chan in
      if String.length (String.trim line) > 0 then
        loop (parse_line line :: acc)
      else
        loop acc
    with End_of_file ->
      close_in chan;
      List.rev acc
  in
  loop []

let () =
  let examples = examples_of_file "ionosphere.train.csv" in
  Printf.printf "Total examples loaded: %d\n" (List.length examples)

  (**wc -l ionosphere.train.csv**)