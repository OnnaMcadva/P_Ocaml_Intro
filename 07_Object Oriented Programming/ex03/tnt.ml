class tnt =
  object
    inherit Molecule.molecule "Trinitrotoluene" [
      (* C7H5N3O6 *)
      (new Carbon.carbon :> Atom.atom); (new Carbon.carbon :> Atom.atom);
      (new Carbon.carbon :> Atom.atom); (new Carbon.carbon :> Atom.atom);
      (new Carbon.carbon :> Atom.atom); (new Carbon.carbon :> Atom.atom);
      (new Carbon.carbon :> Atom.atom);
      (new Hydrogen.hydrogen :> Atom.atom); (new Hydrogen.hydrogen :> Atom.atom);
      (new Hydrogen.hydrogen :> Atom.atom); (new Hydrogen.hydrogen :> Atom.atom);
      (new Hydrogen.hydrogen :> Atom.atom);
      (new Nitrogen.nitrogen :> Atom.atom); (new Nitrogen.nitrogen :> Atom.atom);
      (new Nitrogen.nitrogen :> Atom.atom);
      (new Oxygen.oxygen :> Atom.atom); (new Oxygen.oxygen :> Atom.atom);
      (new Oxygen.oxygen :> Atom.atom); (new Oxygen.oxygen :> Atom.atom);
      (new Oxygen.oxygen :> Atom.atom); (new Oxygen.oxygen :> Atom.atom)
    ]
  end
