let ft_print_comb2 () =
  let rec loop_a a =
    if a <= 98 then
      let rec loop_b b =
        if b <= 99 then begin
          if a < b then begin
            print_int (a / 10);
            print_int (a mod 10);
            print_char ' ';
            print_int (b / 10);
            print_int (b mod 10);
            if not (a = 98 && b = 99) then
              print_string ", "
          end;
          loop_b (b + 1)
        end
      in
      loop_b (a + 1);
      loop_a (a + 1)
  in
  loop_a 0;
  print_char '\n'

let () =
  ft_print_comb2 ()
