class virtual molecule (name_param : string) (atoms_param : Atom.atom list) =
  object (self)
    method name : string = name_param

    method private count_atoms : (string * int) list =
      let rec add_to_list symbol acc =
        match acc with
        | [] -> [(symbol, 1)]
        | (s, count) :: tail ->
            if s = symbol then (s, count + 1) :: tail
            else (s, count) :: (add_to_list symbol tail)
      in
      let rec loop list acc =
        match list with
        | [] -> acc
        | (atom : Atom.atom) :: tail -> loop tail (add_to_list atom#symbol acc)
      in
      loop atoms_param []

    method formula : string =
      let counts = self#count_atoms in
      let has_carbon = List.exists (fun (s, _) -> s = "C") counts in
      let c_count = try List.assoc "C" counts with Not_found -> 0 in
      let h_count = try List.assoc "H" counts with Not_found -> 0 in
      
      let format_pair (sym, count) =
        if count = 1 then sym else sym ^ (string_of_int count)
      in

      if has_carbon then
        let part_c = if c_count > 0 then format_pair ("C", c_count) else "" in
        let part_h = if h_count > 0 then format_pair ("H", h_count) else "" in
        let remaining = List.filter (fun (s, _) -> s <> "C" && s <> "H") counts in
        let sorted_remaining = List.sort (fun (a, _) (b, _) -> compare a b) remaining in
        let part_rest = String.concat "" (List.map format_pair sorted_remaining) in
        part_c ^ part_h ^ part_rest
      else
        let sorted_all = List.sort (fun (a, _) (b, _) -> compare a b) counts in
        String.concat "" (List.map format_pair sorted_all)

    method to_string : string =
      "Molecule: " ^ self#name ^ " (" ^ self#formula ^ ")"

    method equals (other : molecule) : bool =
      self#formula = other#formula
  end
