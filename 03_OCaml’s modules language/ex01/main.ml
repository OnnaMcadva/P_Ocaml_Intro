let print_value value =
  print_endline
    (Value.toString value ^ " | " ^ Value.toStringVerbose value ^ " | "
    ^ string_of_int (Value.toInt value))

let rec print_all = function
  | [] -> ()
  | value :: rest ->
      print_value value;
      print_all rest

let test_next_previous () =
  print_endline "\n\x1b[4;32mTesting next:\x1b[0m";
  print_endline (Value.toString (Value.next Value.T2));
  print_endline (Value.toString (Value.next Value.T10));
  print_endline (Value.toString (Value.next Value.King));
  print_endline "\n\x1b[4;33mTesting previous:\x1b[0m";
  print_endline (Value.toString (Value.previous Value.T3));
  print_endline (Value.toString (Value.previous Value.Jack));
  print_endline (Value.toString (Value.previous Value.As))

let test_invalid () =
  print_endline "\n\x1b[4;31mTesting invalid_arg handling:\x1b[0m";
  (try
     ignore (Value.next Value.As)
   with
   | Invalid_argument msg -> print_endline msg);
  (try
     ignore (Value.previous Value.T2)
   with
   | Invalid_argument msg -> print_endline msg)

let () =
  print_endline "\n\x1b[4;32mTesting Value.all:\x1b[0m";
  print_all Value.all;
  test_next_previous ();
  test_invalid ()
