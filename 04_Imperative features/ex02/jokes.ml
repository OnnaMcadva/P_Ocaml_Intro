let () =

  Random.self_init ();

  let jokes = [|
    "Why do Java programmers have to wear glasses? Because they don't C#.";
    "There are 10 types of people in the world: those who understand binary, and those who don't.";
    "How many programmers does it take to change a light bulb? None, that's a hardware problem.";
    "What's a programmer's favorite hangout place? Foo Bar.";
    "0 is false, 1 is true. Right? 1-0."
  |] in

  let random_index = Random.int (Array.length jokes) in
  
  print_endline jokes.(random_index)