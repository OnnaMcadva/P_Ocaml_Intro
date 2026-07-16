let () =
  print_endline "--- Testing Exercise 01: Doctor ---";
  let rose = new People.people "Rose Tyler" in
  let doc = new Doctor.doctor "The 10th Doctor" 900 rose in
  
  print_endline doc#to_string;
  doc#talk;
  doc#use_sonic_screwdriver;
  
  print_endline "Traveling from 2005 to 2015...";
  doc#travel_in_time 2005 2015;
  print_endline doc#to_string;
  
  print_endline "Testing regeneration (taking 120 damage)...";
  doc#take_damage 120;
  print_endline doc#to_string;
  print_endline "--- End of Test ---"
