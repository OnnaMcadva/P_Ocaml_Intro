let () =
  print_endline "--- Testing Exercise 03: Armies ---";
  
  print_endline "\n--- 1. Creating Human Army ---";
  let human_army = new Army.army in
  let h1 = new People.people "Amy Pond" in
  let h2 = new People.people "Rory Williams" in
  human_army#add h1;
  human_army#add h2;
  print_endline ("Army size: " ^ (string_of_int (List.length human_army#get_members)));
  human_army#delete;
  print_endline ("Human Army size after 1 deletion: " ^ (string_of_int (List.length human_army#get_members)));

  print_endline "\n--- 2. Creating Dalek Army ---";
  let dalek_army = new Army.army in
  let d1 = new Dalek.dalek in
  let d2 = new Dalek.dalek in
  dalek_army#add d1;
  dalek_army#add d2;
  print_endline ("Dalek Army size: " ^ (string_of_int (List.length dalek_army#get_members)));

  print_endline "\n--- 3. Destroying Dalek Army (deleting head) ---";
  dalek_army#delete;
  print_endline ("Dalek Army size after 1 deletion: " ^ (string_of_int (List.length dalek_army#get_members)));
  dalek_army#delete;
  print_endline ("Dalek Army size after 2 deletions: " ^ (string_of_int (List.length dalek_army#get_members)));

  print_endline "\n--- 4. Creating Doctor Army ---";
  let doctor_army = new Army.army in
  let sidekick1 = new People.people "Amy Pond" in
  let sidekick2 = new People.people "Clara Oswald" in
  let doc1 = new Doctor.doctor "The 11th Doctor" 907 sidekick1 in
  let doc2 = new Doctor.doctor "The 12th Doctor" 2000 sidekick2 in
  doctor_army#add doc1;
  doctor_army#add doc2;
  print_endline ("Doctor Army size: " ^ (string_of_int (List.length doctor_army#get_members)));
  doctor_army#delete;
  print_endline ("Doctor Army size after 1 deletion: " ^ (string_of_int (List.length doctor_army#get_members)));
  doctor_army#delete;
  print_endline ("Doctor Army size after 2 deletions: " ^ (string_of_int (List.length doctor_army#get_members)));

  print_endline "--- End of Test ---"
