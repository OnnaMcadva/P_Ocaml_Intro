exception Reaction_not_balanced

class alkane_combustion (alkanes_list : Alkane.alkane list) =
  object (self)
    inherit Reaction.reaction [] []

    method private get_n (alk : Alkane.alkane) : int =
      let formula = alk#formula in
      if String.get formula 0 = 'C' then
        let rec get_digits idx acc =
          if idx < String.length formula then
            let c = String.get formula idx in
            if c >= '0' && c <= '9' then get_digits (idx + 1) (acc ^ String.make 1 c)
            else acc
          else acc
        in
        let digits = get_digits 1 "" in
        if digits = "" then 1 else int_of_string digits
      else 1

    method is_balanced : bool =
      match alkanes_list with
      | [] -> true
      | [alk] ->
          let _n = self#get_n alk in
          true
      | _ -> false

    method get_start : (Molecule.molecule * int) list =
      if not self#is_balanced then raise Reaction_not_balanced
      else
        match alkanes_list with
        | [] -> []
        | [alk] ->
            let n = self#get_n alk in
            let alk_coeff, o2_coeff =
              if (3 * n + 1) mod 2 = 0 then
                (1, (3 * n + 1) / 2)
              else
                (2, 3 * n + 1)
            in
            let sorted = [
              ((alk :> Molecule.molecule), alk_coeff);
              ((object inherit Molecule.molecule "Oxygen" [(new Oxygen.oxygen :> Atom.atom); (new Oxygen.oxygen :> Atom.atom)] end :> Molecule.molecule), o2_coeff)
            ] in
            List.sort (fun (a, _) (b, _) -> compare a#formula b#formula) sorted
        | _ -> raise Reaction_not_balanced

    method get_result : (Molecule.molecule * int) list =
      if not self#is_balanced then raise Reaction_not_balanced
      else
        match alkanes_list with
        | [] -> []
        | [alk] ->
            let n = self#get_n alk in
            let co2_coeff, h2o_coeff =
              if (3 * n + 1) mod 2 = 0 then
                (n, n + 1)
              else
                (2 * n, 2 * (n + 1))
            in
            let sorted = [
              ((new Carbon_dioxide.carbon_dioxide :> Molecule.molecule), co2_coeff);
              ((new Water.water :> Molecule.molecule), h2o_coeff)
            ] in
            List.sort (fun (a, _) (b, _) -> compare a#formula b#formula) sorted
        | _ -> raise Reaction_not_balanced

    method balance : Reaction.reaction =
      (new alkane_combustion alkanes_list :> Reaction.reaction)
  end
