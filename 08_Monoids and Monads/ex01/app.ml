module App :
  sig
    type project = string * string * int
    val zero : project
    val combine : project -> project -> project
    val fail : project -> project
    val success : project -> project
  end =

  struct
    type project = string * string * int

    let zero : project = ("", "", 0)

    let combine (p1 : project) (p2 : project) : project =
      let (n1, s1, g1) = p1 in
      let (n2, s2, g2) = p2 in
      if p1 = zero then p2
      else if p2 = zero then p1
      else
        let new_name = if n1 = "" then n2 else if n2 = "" then n1 else n1 ^ " " ^ n2 in
        let avg_grade = (g1 + g2) / 2 in
        let new_status = if avg_grade > 80 then "succeed" else "failed" in
        (new_name, new_status, avg_grade)

    let fail (p : project) : project =
      let (name, _, _) = p in
      (name, "failed", 0)

    let success (p : project) : project =
      let (name, _, _) = p in
      (name, "succeed", 80)
  end

  let print_proj (p : App.project) : unit =
    let (name, status, grade) = p in
    Printf.printf "Project [Name: %S, Status: %S, Grade: %d]\n" name status grade

let () =

  let p1 = ("Compiler", "succeed", 95) in
  let p2 = ("Engine", "failed", 60) in
  
  print_string "p1: "; print_proj p1;
  print_string "p2: "; print_proj p2;
  
  let combined = App.combine p1 p2 in
  print_string "Combined: "; print_proj combined;
  
  print_string "Failed p1: "; print_proj (App.fail p1);
  print_string "Success p2: "; print_proj (App.success p2);
