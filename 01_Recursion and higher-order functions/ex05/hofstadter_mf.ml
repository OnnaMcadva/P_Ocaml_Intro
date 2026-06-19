let rec hfs_f n =
  if n < 0 then -1
  else if n = 0 then 1
  else n - hfs_m (hfs_f (n - 1))
and hfs_m n =
  if n < 0 then -1
  else if n = 0 then 0
  else n - hfs_f (hfs_m (n - 1))

let () =
  Printf.printf "%d\n" (hfs_m 0);
  Printf.printf "%d\n" (hfs_f 0);
  Printf.printf "%d\n" (hfs_m 4);
  Printf.printf "%d\n" (hfs_f 4);
  Printf.printf "%d\n" (hfs_m 10);
  Printf.printf "%d\n" (hfs_f 10)
