let ft_print_comb () =
  let rec loop a =
    if a <= 7 then
      let rec loop_b b =
        if b <= 8 then
          let rec loop_c c =
            if c <= 9 then begin
              if a < b && b < c then begin
                print_int a;
                print_int b;
                print_int c;
                if not (a = 7 && b = 8 && c = 9) then
                  print_string ", "
              end;
              loop_c (c + 1)
            end
          in
          loop_c (b + 1);
          loop_b (b + 1)
      in
      loop_b (a + 1);
      loop a (a + 1)
  in
  loop 0;
  print_char '\n'

let () =
  ft_print_comb ()
