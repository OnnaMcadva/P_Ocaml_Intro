type phosphate = string
type deoxyribose = string
type nucleobase = A | T | C | G | None

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
  | None -> "None"

let () =
  let n = generate_nucleotide 'A' in
  Printf.printf "phosphate: %s, deoxyribose: %s, base: %s\n"
    n.phosphate n.deoxyribose (string_of_nucleobase n.nucleobase);
  let n2 = generate_nucleotide 'X' in
  Printf.printf "phosphate: %s, deoxyribose: %s, base: %s\n"
    n2.phosphate n2.deoxyribose (string_of_nucleobase n2.nucleobase)
