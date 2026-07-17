let () =

  let h1 = new Hydrogen.hydrogen in
  let h2 = new Hydrogen.hydrogen in
  let c = new Carbon.carbon in
  let o = new Oxygen.oxygen in
  let n = new Nitrogen.nitrogen in
  let na = new Sodium.sodium in
  let cl = new Chlorine.chlorine in

  print_endline h1#to_string;
  print_endline c#to_string;
  print_endline o#to_string;
  print_endline n#to_string;
  print_endline na#to_string;
  print_endline cl#to_string;

  Printf.printf "h1 equals h2? %b\n" (h1#equals (h2 :> Atom.atom));
  Printf.printf "h1 equals c? %b\n" (h1#equals (c :> Atom.atom));
