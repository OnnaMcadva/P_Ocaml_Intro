# 🐫 OCaml

## 📚 Основы

### Комментарии
```ocaml
(* Это комментарий *)
(*
   Многострочный
   комментарий
*)
```

### Типы данных
```ocaml
(* Целые числа *)
let x = 42              (* int *)
let y = -5              (* int *)

(* Числа с плавающей точкой *)
let pi = 3.14           (* float *)
let z = 2.0 *. 3.0      (* float *)

(* Булевы значения *)
let a = true            (* bool *)
let b = false           (* bool *)

(* Символы и строки *)
let c = 'a'             (* char *)
let s = "Hello"         (* string *)

(* Списки *)
let lst = [1; 2; 3]     (* int list *)
let empty = []          (* 'a list *)

(* Кортежи *)
let tuple = (1, "hello", 3.14)  (* int * string * float *)
let (x, y, z) = tuple   (* деструктуризация *)

(* Опциональные значения *)
let maybe = Some 42     (* int option *)
let nothing = None      (* 'a option *)
```

### Переменные и константы
```ocaml
let x = 10              (* неизменяемая переменная *)
let x = 20              (* теневое переопределение (shadowing) *)
let () = print_endline "Hello"  (* игнорирование результата *)
```

---

## 🏗️ Функции

### Объявление функций
```ocaml
(* Простая функция *)
let add x y = x + y
let result = add 3 4    (* 7 *)

(* Безымянная функция (лямбда) *)
fun x -> x * 2
List.map (fun x -> x * 2) [1; 2; 3]

(* Функция с несколькими аргументами *)
let multiply x y z = x * y * z

(* Каррирование (частичное применение) *)
let add5 = add 5        (* функция, ждущая второй аргумент *)
let result = add5 3     (* 8 *)

(* Рекурсивная функция *)
let rec factorial n =
  if n <= 1 then 1
  else n * factorial (n - 1)

(* Взаимная рекурсия *)
let rec even n =
  if n = 0 then true
  else odd (n - 1)
and odd n =
  if n = 0 then false
  else even (n - 1)
```

### Сопоставление с образцом (Pattern Matching)
```ocaml
(* match с выражением *)
let describe x =
  match x with
  | 0 -> "Zero"
  | 1 -> "One"
  | n when n < 0 -> "Negative"
  | _ -> "Other"      (* _ - все остальное *)

(* function - сокращение для match *)
let describe = function
  | 0 -> "Zero"
  | 1 -> "One"
  | _ -> "Other"

(* Сопоставление с кортежем *)
let f (x, y) = match x, y with
  | 0, 0 -> "Both zero"
  | _, 0 -> "Second is zero"
  | 0, _ -> "First is zero"
  | _ -> "Neither is zero"

(* Сопоставление с вариантами *)
let string_of_color = function
  | Spade -> "♠"
  | Heart -> "♥"
  | Diamond -> "♦"
  | Club -> "♣"
```

---

## 📦 Модули

### Создание модуля
```ocaml
(* Файл: color.ml *)
type t = Spade | Heart | Diamond | Club

let all = [Spade; Heart; Diamond; Club]

let toString = function
  | Spade -> "S"
  | Heart -> "H"
  | Diamond -> "D"
  | Club -> "C"

(* Файл: color.mli - интерфейс *)
type t = Spade | Heart | Diamond | Club
val all : t list
val toString : t -> string
```

### Использование модулей
```ocaml
(* Открыть модуль *)
open Color

(* Или использовать с префиксом *)
let x = Color.Spade
let y = Color.toString Color.Heart

(* Вложенные модули *)
module Card = struct
  module Color = struct ... end
  module Value = struct ... end
  type t = ...
end

let x = Card.Color.Spade
```

### Сигнатуры (интерфейсы)
```ocaml
(* Описание модуля *)
module type CARD = sig
  type t                          (* абстрактный тип *)
  val create : int -> t
  val value : t -> int
end

(* Реализация модуля *)
module Card : CARD = struct
  type t = int
  let create x = x mod 13
  let value x = x
  (* secret_helper виден только внутри *)
  let secret_helper x = x * 2
end
```

---

## 🎨 Алгебраические типы данных

### Суммирующие типы (варианты)
```ocaml
(* Простые варианты *)
type color = Red | Green | Blue

(* Варианты с данными *)
type shape =
  | Circle of float          (* радиус *)
  | Rectangle of float * float (* ширина * высота *)
  | Square of float          (* сторона *)

let area = function
  | Circle r -> 3.14 *. r *. r
  | Rectangle (w, h) -> w *. h
  | Square s -> s *. s
```

### Рекурсивные типы
```ocaml
(* Список *)
type 'a list =
  | Nil
  | Cons of 'a * 'a list

(* Дерево *)
type 'a tree =
  | Leaf
  | Node of 'a * 'a tree * 'a tree

let rec depth = function
  | Leaf -> 0
  | Node (_, left, right) -> 1 + max (depth left) (depth right)
```

### Записи (records)
```ocaml
type person = {
  name : string;
  age : int;
  email : string option;  (* опциональное поле *)
}

let p1 = { name = "Alice"; age = 25; email = Some "alice@mail.com" }

(* Доступ к полям *)
let name = p1.name

(* Копирование записи с изменением *)
let p2 = { p1 with age = 26 }

(* Сопоставление с записью *)
let describe { name; age; email } =
  match email with
  | Some e -> name ^ " (" ^ string_of_int age ^ ") - " ^ e
  | None -> name ^ " (" ^ string_of_int age ^ ")"
```

---

## 🔧 Работа со списками

### Основные операции
```ocaml
(* Конкатенация *)
let lst1 = [1; 2; 3]
let lst2 = [4; 5; 6]
let lst3 = lst1 @ lst2    (* [1; 2; 3; 4; 5; 6] *)

(* Head и Tail *)
let head = List.hd [1; 2; 3]  (* 1 *)
let tail = List.tl [1; 2; 3]  (* [2; 3] *)

(* Добавление в начало *)
let new_lst = 0 :: [1; 2; 3]   (* [0; 1; 2; 3] *)
```

### Итераторы
```ocaml
(* map - преобразует каждый элемент *)
let doubled = List.map (fun x -> x * 2) [1; 2; 3]  (* [2; 4; 6] *)

(* filter - оставляет только нужные *)
let evens = List.filter (fun x -> x mod 2 = 0) [1; 2; 3; 4]  (* [2; 4] *)

(* fold - сворачивает список *)
let sum = List.fold_left (+) 0 [1; 2; 3]  (* 6 *)
let product = List.fold_left ( * ) 1 [1; 2; 3]  (* 6 *)

(* iter - применяет функцию для эффекта *)
List.iter (fun x -> print_int x) [1; 2; 3]

(* exists - проверяет, есть ли элемент *)
let has_even = List.exists (fun x -> x mod 2 = 0) [1; 2; 3]  (* true *)

(* for_all - проверяет все элементы *)
let all_positive = List.for_all (fun x -> x > 0) [1; 2; 3]  (* true *)
```

### Полезные функции
```ocaml
(* Длина списка *)
List.length [1; 2; 3]   (* 3 *)

(* Разворот *)
List.rev [1; 2; 3]      (* [3; 2; 1] *)

(* Получение элемента по индексу *)
List.nth [1; 2; 3] 1    (* 2 *)

(* Сортировка *)
List.sort compare [3; 1; 2]  (* [1; 2; 3] *)

(* Уникальные элементы *)
List.sort_uniq compare [1; 2; 1; 3]  (* [1; 2; 3] *)
```

---

## 🎯 Паттерн-матчинг с функциями

### Сокращения
```ocaml
(* Вместо: *)
let rec sum = function
  | [] -> 0
  | h :: t -> h + sum t

(* Можно использовать function: *)
let rec sum = function
  | [] -> 0
  | h :: t -> h + sum t

(* Сразу в map: *)
let doubled = List.map (function x -> x * 2) [1; 2; 3]
```

---

## 🚀 Полезные идиомы

### Pipe оператор `|>`
```ocaml
(* Традиционный способ *)
let result = List.map (fun x -> x * 2) (List.filter (fun x -> x > 0) [1; -2; 3])

(* С pipe - читается слева направо *)
let result = [1; -2; 3]
  |> List.filter (fun x -> x > 0)
  |> List.map (fun x -> x * 2)
```

### Игнорирование значения
```ocaml
let _ = some_side_effect_function ()
let () = print_endline "Hello"  (* тоже самое, но явно *)
```

### Option обработка
```ocaml
match some_option with
| Some x -> print_endline ("Value: " ^ string_of_int x)
| None -> print_endline "Nothing!"

(* Или с использованием функций *)
Option.iter (fun x -> print_endline (string_of_int x)) some_option
```

---

## 🐛 Ошибки и их решение

### Типичные ошибки

```ocaml
(* Ошибка: тип int vs float *)
let x = 5 +. 3.0   (* ОШИБКА! нужно 5.0 +. 3.0 *)

(* Ошибка: неполное сопоставление *)
let f = function  (* Предупреждение/ошибка *)
  | 0 -> "zero"  (* нет обработки других случаев *)

(* Исправление: *)
let f = function
  | 0 -> "zero"
  | _ -> "other"

(* Ошибка: рекурсия без rec *)
let fact n =      (* ОШИБКА! *)
  if n <= 1 then 1
  else n * fact (n - 1)
(* Исправление: *)
let rec fact n = ...
```

---

## 📖 Полезные модули стандартной библиотеки

| Модуль | Назначение |
|--------|------------|
| `List` | Операции со списками |
| `Array` | Операции с массивами |
| `String` | Операции со строками |
| `Char` | Операции с символами |
| `Int` | Операции с целыми числами |
| `Float` | Операции с числами с плавающей точкой |
| `Option` | Операции с опциональными значениями |
| `Printf` | Форматированный вывод |
| `Random` | Генерация случайных чисел |
| `Sys` | Системные функции |

---

## 🎓 Компиляция

```bash
# Компиляция в байт-код
ocamlc -c file.ml      # создает file.cmo
ocamlc -o program file1.cmo file2.cmo

# Компиляция в нативный код (быстрее)
ocamlopt -c file.ml    # создает file.cmx
ocamlopt -o program file1.cmx file2.cmx

# Запуск без компиляции
ocaml file.ml

# REPL (интерактивный режим)
ocaml
```

---

## ✨ Советы

1. **Всегда используй `rec`** для рекурсивных функций
2. **Предпочитай `match`** вместо `if` для сложных условий
3. **Используй `function`** вместо `match` с одним аргументом
4. **Типы выводятся автоматически** - не пиши типы, если не нужно
5. **Используй `|>`** для читаемой цепочки вызовов
6. **Документируй модули** через `.mli` файлы

---

🐫🐫🐫🐫🐫🐫🐫🐫🐫🐫🐫🐫🐫🐫🐫🐫🐫🐫🐫🐫🐫🐫🐫🐫🐫
