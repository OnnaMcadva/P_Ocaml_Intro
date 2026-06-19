let rec ft_print_alphabet c =
  if c <= 'z' then begin
    print_char c;
    ft_print_alphabet (char_of_int (int_of_char c + 1))
  end

let () =
  ft_print_alphabet 'a';
  print_char '\n'
