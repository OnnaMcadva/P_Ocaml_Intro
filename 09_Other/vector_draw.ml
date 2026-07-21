(* vector_draw.ml *)

let width = 600
let height = 600

(* Переводим математические координаты (центр в середине окна,
   ось Y вверх) в координаты Graphics (0,0 слева-снизу, Y вверх — совпадает) *)
let to_screen (x, y) =
  let cx = width / 2 in
  let cy = height / 2 in
  let scale = 50.0 in (* 1 единица вектора = 50 пикселей *)
  (cx + int_of_float (x *. scale), cy + int_of_float (y *. scale))

let draw_arrow (x0, y0) (x1, y1) =
  let (sx0, sy0) = to_screen (x0, y0) in
  let (sx1, sy1) = to_screen (x1, y1) in
  Graphics.moveto sx0 sy0;
  Graphics.lineto sx1 sy1;

  (* рисуем "наконечник" стрелки как два коротких отрезка под углом *)
  let dx = float_of_int (sx1 - sx0) in
  let dy = float_of_int (sy1 - sy0) in
  let len = sqrt (dx *. dx +. dy *. dy) in
  if len > 0.0 then begin
    let ux = dx /. len and uy = dy /. len in
    let head_len = 12.0 in
    let head_angle = 0.4 in (* радианы *)

    let rotate (vx, vy) angle =
      (vx *. cos angle -. vy *. sin angle,
       vx *. sin angle +. vy *. cos angle)
    in
    let (lx, ly) = rotate (-.ux, -.uy) head_angle in
    let (rx, ry) = rotate (-.ux, -.uy) (-.head_angle) in

    Graphics.moveto sx1 sy1;
    Graphics.lineto (sx1 + int_of_float (lx *. head_len))
                     (sy1 + int_of_float (ly *. head_len));
    Graphics.moveto sx1 sy1;
    Graphics.lineto (sx1 + int_of_float (rx *. head_len))
                     (sy1 + int_of_float (ry *. head_len))
  end

let draw_axes () =
  (* Graphics.set_color Graphics.rgb 200 200 200 |> ignore; *)
  Graphics.set_color (Graphics.rgb 200 200 200);
  Graphics.moveto 0 (height / 2);
  Graphics.lineto width (height / 2);
  Graphics.moveto (width / 2) 0;
  Graphics.lineto (width / 2) height

let () =
  Graphics.open_graph (Printf.sprintf " %dx%d" width height);
  Graphics.set_window_title "Vector visualization";

  draw_axes ();

  Graphics.set_color Graphics.black;
  draw_arrow (0.0, 0.0) (3.0, 2.0);   (* вектор (3,2) *)

  Graphics.set_color Graphics.red;
  draw_arrow (0.0, 0.0) (-2.0, 1.5);  (* ещё один вектор *)

  print_endline "Press any key to close...";
  ignore (Graphics.read_key ())