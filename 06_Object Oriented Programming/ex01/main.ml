let () =
  let sidekick = new people "Clara" in
  let doc = new doctor "The Doctor" 900 sidekick in
  print_endline (doc#to_string);
  doc#talk;
  doc#travel_in_time 2015 2020;
  print_endline (doc#to_string);
  doc#use_sonic_screwdriver;
  doc#heal;
  print_endline (doc#to_string)
  