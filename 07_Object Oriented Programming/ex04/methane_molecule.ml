class methane_molecule =
  object
    inherit Molecule.molecule "Methane" [
      (new Carbon.carbon :> Atom.atom);
      (new Hydrogen.hydrogen :> Atom.atom);
      (new Hydrogen.hydrogen :> Atom.atom);
      (new Hydrogen.hydrogen :> Atom.atom);
      (new Hydrogen.hydrogen :> Atom.atom)
    ]
  end
