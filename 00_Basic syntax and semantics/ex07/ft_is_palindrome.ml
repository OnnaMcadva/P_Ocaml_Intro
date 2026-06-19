let ft_string_all pred s =
  let len = String.length s in
  let rec loop i =
    if i >= len then true
    else if not (pred (String.get s i)) then false
    else loop (i + 1)
  in
  loop 0

let ft_is_palindrome s =
  let len = String.length s in
  let rec loop i =
    if i >= len / 2 then true
    else if String.get s i <> String.get s (len - 1 - i) then false
    else loop (i + 1)
  in
  let _ = ft_string_all (fun _ -> true) s in
  loop 0

let () =
  Printf.printf "%b\n" (ft_is_palindrome "radar");
  Printf.printf "%b\n" (ft_is_palindrome "madam");
  Printf.printf "%b\n" (ft_is_palindrome "car");
  Printf.printf "%b\n" (ft_is_palindrome "")
