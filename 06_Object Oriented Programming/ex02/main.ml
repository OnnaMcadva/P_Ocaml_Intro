let () =
  Random.self_init ();
  let human = new people "Rose" in
  let dalek = new dalek () in
  let doc = new doctor "The Doctor" 900 human in

  print_endline "=== Initial state ===";
  print_endline (human#to_string);
  print_endline (dalek#to_string);
  print_endline (doc#to_string);

  print_endline "=== Dalek talks ===";
  dalek#talk;

  print_endline "=== Dalek exterminates human ===";
  dalek#exterminate human;
  print_endline (human#to_string);
  print_endline (dalek#to_string);

  print_endline "=== Doctor talks ===";
  doc#talk;

  print_endline "=== Doctor travels in time ===";
  doc#travel_in_time 2000 2022;
  print_endline (doc#to_string);

  print_endline "=== Doctor uses sonic screwdriver ===";
  doc#use_sonic_screwdriver;

  print_endline "=== Doctor heals ===";
  doc#heal;
  print_endline (doc#to_string);

  print_endline "=== Dalek dies ===";
  dalek#die
  