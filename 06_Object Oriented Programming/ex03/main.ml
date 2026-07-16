let () =
  print_endline "--- Testing Exercise 03: Armies ---";
  
  print_endline "\n--- 1. Creating Human Army ---";
  let human_army = new Army.army in
  let h1 = new People.people "Amy Pond" in
  let h2 = new People.people "Rory Williams" in
  human_army#add h1;
  human_army#add h2;
  print_endline ("Army size: " ^ (string_of_int (List.length human_army#get_members)));

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
  
  print_endline "--- End of Test ---"
