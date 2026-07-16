let () =
  print_endline "--- Testing Exercise 00: People ---";
  let Rose = new People.people "Rose Tyler" in
  print_endline Rose#to_string;
  Rose#talk;
  Rose#die;
  print_endline "--- End of Test ---"
