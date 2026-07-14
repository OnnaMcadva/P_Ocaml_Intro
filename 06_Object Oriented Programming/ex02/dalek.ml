let random_string len =
  let chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789" in
  let rec aux acc n =
    if n = 0 then acc
    else
      let c = String.get chars (Random.int (String.length chars)) in
      aux (acc ^ String.make 1 c) (n - 1)
  in
  aux "" len

class dalek () =
  object (self)
    val mutable hp = 100
    val mutable shield = true
    val name = "Dalek" ^ (random_string 3)

    method get_name = name
    method get_hp = hp
    method set_hp new_hp = hp <- new_hp
    method get_shield = shield
    method toggle_shield = shield <- not shield

    method to_string =
      "Dalek: " ^ name ^ ", HP: " ^ string_of_int hp ^ ", Shield: " ^ string_of_bool shield

    method talk =
      let phrases = [
        "Explain! Explain!";
        "Exterminate! Exterminate!";
        "I obey!";
        "You are the Doctor! You are the enemy of the Daleks!"
      ] in
      let idx = Random.int (List.length phrases) in
      print_endline (List.nth phrases idx)

    method exterminate (p : people) =
      p#set_hp 0;
      shield <- not shield;
      print_endline ("Exterminated " ^ p#get_name)

    method die =
      print_endline "Emergency Temporal Shift!"

    initializer
      print_endline ("A new Dalek named " ^ name ^ " has been created!")
  end
  