class carbon_dioxide =
  object
    inherit Molecule.molecule "Carbon dioxide" [
      (new Carbon.carbon :> Atom.atom);
      (new Oxygen.oxygen :> Atom.atom);
      (new Oxygen.oxygen :> Atom.atom)
    ]
  end
