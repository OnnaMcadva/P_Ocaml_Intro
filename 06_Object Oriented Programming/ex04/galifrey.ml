class galifrey =
  object (self)
    val mutable daleks : Dalek.dalek list = []
    val mutable doctors : Doctor.doctor list = []
    val mutable people : People.people list = []

    method add_dalek (d : Dalek.dalek) = daleks <- d :: daleks
    method add_doctor (doc : Doctor.doctor) = doctors <- doc :: doctors
    method add_people (p : People.people) = people <- p :: people

    method get_daleks = daleks
    method get_doctors = doctors
    method get_people = people

    method do_time_war =
      print_endline "\n!!! THE TIME WAR HAS BEGUN !!!\n";
      let rec war_loop () =
        (* Odstranění mrtvých lidí *)
        let alive_people = List.filter (fun p -> p#get_hp > 0) people in
        people <- alive_people;

        match daleks, doctors with
        | [], _ -> 
            print_endline "The Time Lords and Humans have won the Time War!"
        | _, [] -> 
            print_endline "The Daleks have conquered Gallifrey! EXTERMINATE!"
        | d :: d_tail, doc :: doc_tail ->
            print_endline "--- Round of Combat ---";
            d#talk;
            doc#talk;
            doc#use_sonic_screwdriver;
            
            (* Dalek útočí na náhodného člověka, pokud nějací žijí *)
            (match people with
            | p :: _ -> d#exterminate p
            | [] -> 
                print_endline "No humans left! Dalek attacks the Doctor!";
                doc#take_damage 50);

            (* Simulace zničení Daleka *)
            d#die;
            daleks <- d_tail;
            war_loop ()
      in
      war_loop ()
  end
