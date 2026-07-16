class people (name_param : string) =
  object (self)
    val name : string = name_param
    val hp : int = 100

    initializer
      print_endline ("A new human has entered the universe: " ^ name ^ "!")

    method get_name = name
    method get_hp = hp

    method to_string =
      "Human [Name: " ^ name ^ ", HP: " ^ (string_of_int hp) ^ "]"

    method talk =
      print_endline ("I'm " ^ name ^ "! Do you know the Doctor?")

    method die =
      print_endline "Aaaarghh!"
  end
