class doctor (name : string) (initial_age : int) (sidekick : people) =
  object (self)
    val mutable age = initial_age
    val mutable hp = 100

    method get_name = name
    method get_age = age
    method get_sidekick = sidekick
    method get_hp = hp
    method set_hp new_hp = hp <- new_hp

    method to_string =
      "Doctor: " ^ name ^ ", Age: " ^ string_of_int age ^
      ", Sidekick: " ^ sidekick#to_string ^ ", HP: " ^ string_of_int hp

    method talk =
      print_endline "Hi! I'm the Doctor!"

    method travel_in_time start arrival =
      let diff = arrival - start in
      age <- age + diff;
      if age < 0 then age <- 0;
      print_endline "TARDIS:";
      print_endline "    ______________";
      print_endline "   /              \\";
      print_endline "  /                \\";
      print_endline " |   [   TARDIS   ] |";
      print_endline "  \\                /";
      print_endline "   \\______________/";
      print_endline ""

    method use_sonic_screwdriver =
      print_endline "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii"

    method private regenerate =
      hp <- 100;
      print_endline "The Doctor regenerates! HP restored to 100."

    method heal =
      self#regenerate

    initializer
      print_endline ("A new Doctor named " ^ name ^ " has been created!")
  end
  