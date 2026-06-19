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
    | 'A' -> A | 'T' -> T | 'C' -> C | 'G' -> G | _ -> None
  in
  { phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = base }

let string_of_nucleobase = function
  | A -> "A" | T -> "T" | C -> "C" | G -> "G" | U -> "U" | None -> "None"

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
      | A -> T | T -> A | C -> G | G -> C | _ -> None
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
    | A -> T | T -> U | C -> G | G -> C | _ -> None
  in
  let rec aux h acc =
    match h with
    | [] -> List.rev acc
    | n :: t -> aux t (to_rna_base n.nucleobase :: acc)
  in
  aux h []

type aminoacid =
  | Stop | Ala | Arg | Asn | Asp | Cys | Gln | Glu | Gly | His
  | Ile  | Leu | Lys | Met | Phe | Pro | Ser | Thr | Trp | Tyr | Val

type protein = aminoacid list

let string_of_aminoacid = function
  | Stop -> "Stop" | Ala -> "Ala" | Arg -> "Arg" | Asn -> "Asn"
  | Asp  -> "Asp"  | Cys -> "Cys" | Gln -> "Gln" | Glu -> "Glu"
  | Gly  -> "Gly"  | His -> "His" | Ile -> "Ile"  | Leu -> "Leu"
  | Lys  -> "Lys"  | Met -> "Met" | Phe -> "Phe"  | Pro -> "Pro"
  | Ser  -> "Ser"  | Thr -> "Thr" | Trp -> "Trp"  | Tyr -> "Tyr"
  | Val  -> "Val"

let string_of_protein p =
  let rec aux p acc =
    match p with
    | [] -> acc
    | [a] -> acc ^ string_of_aminoacid a
    | a :: t -> aux t (acc ^ string_of_aminoacid a ^ "-")
  in
  aux p ""

let generate_bases_triplets r =
  let rec aux r acc =
    match r with
    | a :: b :: c :: t -> aux t ((a, b, c) :: acc)
    | _ -> List.rev acc
  in
  aux r []

let decode_triplet = function
  | (U,A,A) | (U,A,G) | (U,G,A) -> Stop
  | (G,C,A) | (G,C,C) | (G,C,G) | (G,C,U) -> Ala
  | (A,G,A) | (A,G,G) | (C,G,A) | (C,G,C) | (C,G,G) | (C,G,U) -> Arg
  | (A,A,C) | (A,A,U) -> Asn
  | (G,A,C) | (G,A,U) -> Asp
  | (U,G,C) | (U,G,U) -> Cys
  | (C,A,A) | (C,A,G) -> Gln
  | (G,A,A) | (G,A,G) -> Glu
  | (G,G,A) | (G,G,C) | (G,G,G) | (G,G,U) -> Gly
  | (C,A,C) | (C,A,U) -> His
  | (A,U,A) | (A,U,C) | (A,U,U) -> Ile
  | (C,U,A) | (C,U,C) | (C,U,G) | (C,U,U) | (U,U,A) | (U,U,G) -> Leu
  | (A,A,A) | (A,A,G) -> Lys
  | (A,U,G) -> Met
  | (U,U,C) | (U,U,U) -> Phe
  | (C,C,A) | (C,C,C) | (C,C,G) | (C,C,U) -> Pro
  | (U,C,A) | (U,C,C) | (U,C,G) | (U,C,U) | (A,G,U) | (A,G,C) -> Ser
  | (A,C,A) | (A,C,C) | (A,C,G) | (A,C,U) -> Thr
  | (U,G,G) -> Trp
  | (U,A,C) | (U,A,U) -> Tyr
  | (G,U,A) | (G,U,C) | (G,U,G) | (G,U,U) -> Val
  | _ -> Stop

let decode_arn r =
  let triplets = generate_bases_triplets r in
  let rec aux triplets acc =
    match triplets with
    | [] -> List.rev acc
    | t :: rest ->
      let aa = decode_triplet t in
      if aa = Stop then List.rev (Stop :: acc)
      else aux rest (aa :: acc)
  in
  aux triplets []

let life s =
  let n = String.length s in
  Printf.printf "=== Life pipeline: input length %d ===\n" n;
  let h = generate_helix n in
  Printf.printf "1. Helix:         %s\n" (helix_to_string h);
  let ch = complementary_helix h in
  Printf.printf "2. Complementary: %s\n" (helix_to_string ch);
  let r = generate_rna h in
  Printf.printf "3. RNA:           ";
  List.iter (fun b -> print_string (string_of_nucleobase b)) r;
  print_char '\n';
  let p = decode_arn r in
  Printf.printf "4. Protein:       %s\n" (string_of_protein p);
  ignore s

let () =
  Random.self_init ();
  life "Hello, 42 Prague!"
