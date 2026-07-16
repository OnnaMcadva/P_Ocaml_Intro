class dalek =
  object (self)
    val name : string = 
      let () = Random.self_init () in
      let char_pool = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" in
      let rand_char () = String.make 1 (String.get char_pool (Random.int (String.length char_pool))) in
      "Dalek" ^ (rand_char ()) ^ (rand_char ()) ^ (rand_char ())
    
    val hp : int = 100
    val mutable shield : bool = true

    method get_name = name
    method get_hp = hp
    method get_shield = shield

    method to_string =
      "Dalek [Name: " ^ name ^ ", HP: " ^ (string_of_int hp) ^ 
      ", Shield: " ^ (string_of_bool shield) ^ "]"

    method talk =
      let phrases = [|
        "Explain! Explain!";
        "Exterminate! Exterminate!";
        "I obey!";
        "You are the Doctor! You are the enemy of the Daleks!"
      |] in
      print_endline (Array.get phrases (Random.int 4))

    method exterminate (target : People.people) =
      print_endline (name ^ " targets " ^ target#get_name ^ "!");
      target#die;
      shield <- not shield

    method die =
      print_endline "Emergency Temporal Shift!"
  end
