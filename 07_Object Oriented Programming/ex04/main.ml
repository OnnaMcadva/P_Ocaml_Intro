let () =

  let m = new Methane.methane in
  let e = new Ethane.ethane in

  let combustion_m = new Alkane_combustion.alkane_combustion [m] in
  let combustion_e = new Alkane_combustion.alkane_combustion [e] in

  print_endline "--- Methane Combustion (n = 1) ---";
  List.iter (fun (m, q) -> Printf.printf "%s * %d\n" m#formula q) combustion_m#get_start;
  print_endline "-> yields ->";
  List.iter (fun (m, q) -> Printf.printf "%s * %d\n" m#formula q) combustion_m#get_result;

  print_endline "\n--- Ethane Combustion (n = 2) ---";
  List.iter (fun (m, q) -> Printf.printf "%s * %d\n" m#formula q) combustion_e#get_start;
  print_endline "-> yields ->";
  List.iter (fun (m, q) -> Printf.printf "%s * %d\n" m#formula q) combustion_e#get_result;
