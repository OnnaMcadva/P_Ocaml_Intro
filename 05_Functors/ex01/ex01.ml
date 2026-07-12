module StringHashtbl = Hashtbl.Make(struct
  type t = string
  let equal = ( = )
  let hash s =
    let rec aux i acc =
      if i < 0 then acc
      else aux (i - 1) ((acc * 65599 + Char.code (String.get s i)) land 0x3fffffff)
    in
    aux (String.length s - 1) 0
end)

let () =
  let ht = StringHashtbl.create 5 in
  let values = [ "Hello"; "world"; "42"; "Ocaml"; "H" ] in
  let pairs = List.map (fun s -> (s, String.length s)) values in
  List.iter (fun (k,v) -> StringHashtbl.add ht k v) pairs;
  StringHashtbl.iter (fun k v -> Printf.printf "k = \"%s\", v = %d\n" k v) ht
