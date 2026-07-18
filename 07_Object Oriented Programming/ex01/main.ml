let () =

  let h2o = new Water.water in
  let co2 = new Carbon_dioxide.carbon_dioxide in
  let tnt_mol = new Tnt.tnt in
  let ch4 = new Methane_molecule.methane_molecule in

  print_endline h2o#to_string;
  print_endline co2#to_string;
  print_endline tnt_mol#to_string;
  print_endline ch4#to_string;

  Printf.printf "H2O equals CO2? %b\n" (h2o#equals (co2 :> Molecule.molecule));
