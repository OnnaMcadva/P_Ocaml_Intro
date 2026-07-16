let () =
  print_endline "--- Testing Exercise 02: Dalek Battle ---";
  let human = new People.people "Mickey Smith" in
  let doc = new Doctor.doctor "The 11th Doctor" 1100 human in
  let enemy = new Dalek.dalek in

  print_endline enemy#to_string;
  
  print_endline "\n--- Dalek speaks ---";
  enemy#talk;
  enemy#talk;

  print_endline "\n--- Battle begins ---";
  doc#talk;
  enemy#exterminate human;
  
  print_endline "\n--- Dalek status after extermination (shield should flip) ---";
  print_endline enemy#to_string;

  print_endline "\n--- Doctor fights back ---";
  doc#use_sonic_screwdriver;
  enemy#die;
  print_endline "--- End of Test ---"
