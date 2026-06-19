let sequence n =
  let encode_str s =
    let len = String.length s in
    let rec aux i cur count acc =
      if i >= len then
        acc ^ string_of_int count ^ String.make 1 cur
      else
        let c = String.get s i in
        if c = cur then aux (i + 1) cur (count + 1) acc
        else aux (i + 1) c 1 (acc ^ string_of_int count ^ String.make 1 cur)
    in
    if len = 0 then ""
    else aux 1 (String.get s 0) 1 ""
  in
  let rec aux i s =
    if i >= n then s
    else aux (i + 1) (encode_str s)
  in
  if n <= 0 then ""
  else aux 1 "1"

let () =
  Printf.printf "%s\n" (sequence 1);
  Printf.printf "%s\n" (sequence 2);
  Printf.printf "%s\n" (sequence 3);
  Printf.printf "%s\n" (sequence 4);
  Printf.printf "%s\n" (sequence 5);
  Printf.printf "%s\n" (sequence 6);
  Printf.printf "%s\n" (sequence 0)
