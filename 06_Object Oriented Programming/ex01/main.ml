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

  print_endline "Traveling back from 2015 to 2005...";
  doc#travel_in_time 2015 2005;
  print_endline doc#to_string;
  
  print_endline "Testing non-lethal damage (taking 30 damage)...";
  print_endline ("HP before: " ^ (string_of_int doc#get_hp));
  doc#take_damage 30;
  print_endline ("HP after: " ^ (string_of_int doc#get_hp));

  print_endline "Testing regeneration (taking 120 damage)...";
  print_endline ("HP before: " ^ (string_of_int doc#get_hp));
  doc#take_damage 120;
  print_endline ("HP after: " ^ (string_of_int doc#get_hp));
  print_endline doc#to_string;
  print_endline "--- End of Test ---"
