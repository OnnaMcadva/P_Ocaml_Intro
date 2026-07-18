class water =
  object
    inherit Molecule.molecule "Water" [
      (new Hydrogen.hydrogen :> Atom.atom);
      (new Hydrogen.hydrogen :> Atom.atom);
      (new Oxygen.oxygen :> Atom.atom)
    ]
  end
