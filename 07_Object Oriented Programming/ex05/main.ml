let () =

  let m = new Methane.methane in
  let combustion = new Alkane_combustion.alkane_combustion [m] in

  print_endline "Possible incomplete combustion results for Methane:";
  let results = combustion#get_incomplete_results in
  List.iter (fun (o2_count, products) ->
    Printf.printf "With %d O2 molecules, we get:\n" o2_count;
    List.iter (fun (mol, qty) ->
      Printf.printf "  - %s * %d\n" mol#name qty
    ) products
  ) results;
