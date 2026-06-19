let ft_rot_n n str =
  let rotate_char c =
    if c >= 'a' && c <= 'z' then
      char_of_int ((int_of_char c - int_of_char 'a' + n) mod 26 + int_of_char 'a')
    else if c >= 'A' && c <= 'Z' then
      char_of_int ((int_of_char c - int_of_char 'A' + n) mod 26 + int_of_char 'A')
    else c
  in
  String.map rotate_char str

let () =
  Printf.printf "%s\n" (ft_rot_n 1 "abcdefghijklmnopqrstuvwxyz");
  Printf.printf "%s\n" (ft_rot_n 13 "abcdefghijklmnopqrstuvwxyz");
  Printf.printf "%s\n" (ft_rot_n 42 "0123456789");
  Printf.printf "%s\n" (ft_rot_n 2 "OI2EAS67B9");
  Printf.printf "%s\n" (ft_rot_n 0 "Damned !");
  Printf.printf "%s\n" (ft_rot_n 1 "NBzlk qnbjr !")
