let ft_print_rev s =
  let len = String.length s in
  let rec loop i =
    if i >= 0 then begin
      print_char (String.get s i);
      loop (i - 1)
    end
  in
  loop (len - 1);
  print_char '\n'

let () =
  ft_print_rev "Hello world !";
  ft_print_rev ""
