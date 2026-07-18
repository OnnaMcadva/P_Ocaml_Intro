class virtual alkane (n : int) =
  object (self)
    inherit Molecule.molecule 
      (match n with
       | 1 -> "Methane" | 2 -> "Ethane" | 3 -> "Propane" | 4 -> "Butane"
       | 5 -> "Pentane" | 6 -> "Hexane" | 7 -> "Heptane" | 8 -> "Octane"
       | 9 -> "Nonane" | 10 -> "Decane" | 11 -> "Undecane" | 12 -> "Dodecane"
       | _ -> "Unknown Alkane")
      (
        let rec generate_atoms c_left h_left acc =
          if c_left > 0 then
            generate_atoms (c_left - 1) h_left ((new Carbon.carbon :> Atom.atom) :: acc)
          else if h_left > 0 then
            generate_atoms c_left (h_left - 1) ((new Hydrogen.hydrogen :> Atom.atom) :: acc)
          else
            acc
        in
        generate_atoms n (2 * n + 2) []
      )
  end