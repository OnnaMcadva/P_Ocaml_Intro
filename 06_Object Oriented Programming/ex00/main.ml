let () =
  print_endline "--- Testing Exercise 00: People ---";
  let rose = new People.people "Rose Tyler" in
  print_endline rose#to_string;
  rose#talk;
  rose#die;
  print_endline "--- End of Test ---"
