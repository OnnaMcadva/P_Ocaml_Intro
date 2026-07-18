class virtual atom (name_param : string) (symbol_param : string) (atomic_number_param : int) =
  object (self)
    method name : string = name_param
    method symbol : string = symbol_param
    method atomic_number : int = atomic_number_param

    method to_string : string =
      "Atom: " ^ name_param ^ " (" ^ symbol_param ^ "), Atomic Number: " ^ (string_of_int atomic_number_param)

    method equals (other : atom) : bool =
      self#atomic_number = other#atomic_number
  end
