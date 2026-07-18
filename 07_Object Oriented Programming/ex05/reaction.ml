class virtual reaction (start_param : (Molecule.molecule * int) list) (result_param : (Molecule.molecule * int) list) =
  object (self)
    method virtual get_start : (Molecule.molecule * int) list
    method virtual get_result : (Molecule.molecule * int) list
    method virtual balance : reaction
    method virtual is_balanced : bool
  end
