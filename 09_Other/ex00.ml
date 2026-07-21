(* ex00.ml *)

(* Вектор — просто float array *)
type vector = float array

(* Матрица — массив строк (each row = float array), column-major не важен для этого упражнения *)
type matrix = float array array

(* ---------- Vector operations ---------- *)

(* Мутирует u, добавляя v поэлементно. O(n) time, O(1) extra space *)
let vec_add (u : vector) (v : vector) : unit =
  let n = Array.length u in
  for i = 0 to n - 1 do
    u.(i) <- u.(i) +. v.(i)
  done

let vec_sub (u : vector) (v : vector) : unit =
  let n = Array.length u in
  for i = 0 to n - 1 do
    u.(i) <- u.(i) -. v.(i)
  done

let vec_scl (u : vector) (a : float) : unit =
  let n = Array.length u in
  for i = 0 to n - 1 do
    u.(i) <- u.(i) *. a
  done

(* ---------- Matrix operations ---------- *)

let mat_add (u : matrix) (v : matrix) : unit =
  let rows = Array.length u in
  for i = 0 to rows - 1 do
    let cols = Array.length u.(i) in
    for j = 0 to cols - 1 do
      u.(i).(j) <- u.(i).(j) +. v.(i).(j)
    done
  done

let mat_sub (u : matrix) (v : matrix) : unit =
  let rows = Array.length u in
  for i = 0 to rows - 1 do
    let cols = Array.length u.(i) in
    for j = 0 to cols - 1 do
      u.(i).(j) <- u.(i).(j) -. v.(i).(j)
    done
  done

let mat_scl (u : matrix) (a : float) : unit =
  let rows = Array.length u in
  for i = 0 to rows - 1 do
    let cols = Array.length u.(i) in
    for j = 0 to cols - 1 do
      u.(i).(j) <- u.(i).(j) *. a
    done
  done

(* ---------- Print helpers (только для теста, не часть требуемых функций) ---------- *)

let print_vector (u : vector) : unit =
  Array.iter (fun x -> Printf.printf "[%g]\n" x) u

let print_matrix (u : matrix) : unit =
  Array.iter (fun row ->
    let strs = Array.to_list (Array.map (fun x -> Printf.sprintf "%g" x) row) in
    Printf.printf "[%s]\n" (String.concat ", " strs)
  ) u

(* ---------- Main : тесты ---------- *)

let () =
  print_endline "-- vec_add --";
  let u = [| 2.; 3. |] in
  let v = [| 5.; 7. |] in
  vec_add u v;
  print_vector u;
  (* ожидаем [7.0] [10.0] *)

  print_endline "-- vec_sub --";
  let u = [| 2.; 3. |] in
  let v = [| 5.; 7. |] in
  vec_sub u v;
  print_vector u;
  (* ожидаем [-3.0] [-4.0] *)

  print_endline "-- vec_scl --";
  let u = [| 2.; 3. |] in
  vec_scl u 2.;
  print_vector u;
  (* ожидаем [4.0] [6.0] *)

  print_endline "-- mat_add --";
  let u = [| [| 1.; 2. |]; [| 3.; 4. |] |] in
  let v = [| [| 7.; 4. |]; [| -2.; 2. |] |] in
  mat_add u v;
  print_matrix u;
  (* ожидаем [8.0, 6.0] [1.0, 6.0] *)

  print_endline "-- mat_sub --";
  let u = [| [| 1.; 2. |]; [| 3.; 4. |] |] in
  let v = [| [| 7.; 4. |]; [| -2.; 2. |] |] in
  mat_sub u v;
  print_matrix u;
  (* ожидаем [-6.0, -2.0] [5.0, 2.0] *)

  print_endline "-- mat_scl --";
  let u = [| [| 1.; 2. |]; [| 3.; 4. |] |] in
  mat_scl u 2.;
  print_matrix u
  (* ожидаем [2.0, 4.0] [6.0, 8.0] *)