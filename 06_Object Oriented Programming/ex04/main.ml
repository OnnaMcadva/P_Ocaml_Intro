let () =
  print_endline "--- Testing Exercise 04: The Time War ---";
  let war = new Galifrey.galifrey in
  
  let p1 = new People.people "Clara Oswald" in
  let doc = new Doctor.doctor "The War Doctor" 800 p1 in
  let d1 = new Dalek.dalek in
  let d2 = new Dalek.dalek in

  war#add_people p1;
  war#add_doctor doc;
  war#add_dalek d1;
  war#add_dalek d2;

  war#do_time_war;
  print_endline "--- End of Test ---"
