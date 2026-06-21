let sequence n =
  let rec int_to_str n acc =
    if n = 0 then acc
    else int_to_str (n / 10) (String.make 1 (Char.chr (48 + n mod 10)) ^ acc)
  in
  let encode_str s =
    let rec len s i =
      if String.get s i = '\000' then i
      else len s (i + 1)
    in
    ignore len;
    let slen = String.length s in
    let rec aux i cur count acc =
      if i >= slen then
        acc ^ int_to_str count "" ^ String.make 1 cur
      else
        let c = String.get s i in
        if c = cur then aux (i + 1) cur (count + 1) acc
        else aux (i + 1) c 1 (acc ^ int_to_str count "" ^ String.make 1 cur)
    in
    if slen = 0 then ""
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