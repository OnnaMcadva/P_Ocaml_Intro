let my_sleep () = Unix.sleep 1

let () =
  if Array.length Sys.argv = 2 then
    match int_of_string_opt Sys.argv.(1) with
    | Some seconds when seconds >= 0 ->
        for _ = 1 to seconds do
          my_sleep ()
        done
    | _ -> ()
  else
    ()

(**
time ./out 3
time ./out 30
time ./out abc
time ./out -5
*)