class doctor (name_param : string) (age_param : int) (sidekick_param : People.people) =
  object (self)
    val name : string = name_param
    val mutable age : int = age_param
    val sidekick : People.people = sidekick_param
    val mutable hp : int = 100

    initializer
      print_endline ("The Doctor known as " ^ name ^ " has arrived in the TARDIS!")

    method get_name = name
    method get_age = age
    method get_sidekick = sidekick
    method get_hp = hp

    method to_string =
      "Doctor [Name: " ^ name ^ ", Age: " ^ (string_of_int age) ^ 
      ", HP: " ^ (string_of_int hp) ^ ", Sidekick: " ^ sidekick#get_name ^ "]"

    method talk =
      print_endline "Hi! I'm the Doctor!"

    method travel_in_time (start : int) (arrival : int) =
      age <- age + (arrival - start);
      print_endline "           _  _";
      print_endline "          | || |";
      print_endline "   _______| || |_______";
      print_endline "  /___________________\\";
      print_endline "  |  ___  |  _  |  ___  |";
      print_endline "  | |   | | | | | |   | |";
      print_endline "  | |___| | |_| | |___| |";
      print_endline "  |  ___  |  _  |  ___  |";
      print_endline "  | |   | | | | | |   | |";
      print_endline "  | |___| | |_| | |___| |";
      print_endline "  |_______|_| |_|_______|";
      print_endline "  |_____________________|"

    method use_sonic_screwdriver =
      print_endline "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii"

    method private regenerate =
      hp <- 100;
      print_endline "The Doctor regenerated and restored full health!"

    method take_damage (amount : int) =
      hp <- hp - amount;
      if hp <= 0 then
        self#regenerate
      else
        print_endline (name ^ " took " ^ (string_of_int amount) ^ " damage.")
  end
