type phosphate = string
type deoxyribose = string
type nucleobase = A | T | C | G | U | None

type nucleotide = {
  phosphate : phosphate;
  deoxyribose : deoxyribose;
  nucleobase : nucleobase;
}

let generate_nucleotide c =
  let base = match c with
    | 'A' -> A
    | 'T' -> T
    | 'C' -> C
    | 'G' -> G
    | _   -> None
  in
  { phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = base }

let string_of_nucleobase = function
  | A -> "A"
  | T -> "T"
  | C -> "C"
  | G -> "G"
  | U -> "U"
  | None -> "None"

type helix = nucleotide list

let generate_helix n =
  let bases = [| 'A'; 'T'; 'C'; 'G' |] in
  let rec aux i acc =
    if i = 0 then acc
    else aux (i - 1) (generate_nucleotide bases.(Random.int 4) :: acc)
  in
  aux n []

let helix_to_string h =
  let rec aux h acc =
    match h with
    | [] -> acc
    | n :: t -> aux t (acc ^ string_of_nucleobase n.nucleobase)
  in
  aux h ""

let complementary_helix h =
  let complement n =
    let base = match n.nucleobase with
      | A -> T
      | T -> A
      | C -> G
      | G -> C
      | _ -> None
    in
    { n with nucleobase = base }
  in
  let rec aux h acc =
    match h with
    | [] -> List.rev acc
    | n :: t -> aux t (complement n :: acc)
  in
  aux h []

type rna = nucleobase list

let generate_rna h =
  let to_rna_base = function
    | A -> T
    | T -> U
    | C -> G
    | G -> C
    | _ -> None
  in
  let rec aux h acc =
    match h with
    | [] -> List.rev acc
    | n :: t -> aux t (to_rna_base n.nucleobase :: acc)
  in
  aux h []

let () =
  Random.self_init ();
  let h = generate_helix 10 in
  Printf.printf "helix: %s\n" (helix_to_string h);
  let r = generate_rna h in
  List.iter (fun b -> print_string (string_of_nucleobase b)) r;
  print_char '\n'
