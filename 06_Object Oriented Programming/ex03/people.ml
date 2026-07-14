class people (name : string) =
  object (self)
    val mutable hp = 100

    method get_name = name
    method get_hp = hp
    method set_hp new_hp = hp <- new_hp

    method to_string =
      "Name: " ^ name ^ ", HP: " ^ string_of_int hp

    method talk =
      print_endline ("I'm " ^ name ^ "! Do you know the Doctor?")

    method die =
      print_endline "Aaaarghh!"

    initializer
      print_endline ("A new people named " ^ name ^ " has been created!")
  end
