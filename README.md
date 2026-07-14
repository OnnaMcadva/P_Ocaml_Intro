# P_Ocaml_Intro

Quick presentation

## OCaml Multi-Paradigm Suite

A comprehensive OCaml codebase structured into 9 independent modules. The project spans from core functional programming concepts to advanced module systems, object-oriented design, and monadic structures.

Each module contains multiple exercises (`ex00`, `ex01`, etc.) and is compiled exclusively using the native OCaml compiler (`ocamlopt`) via a dedicated, feature-rich `Makefile`.

---

## 📂 Project Structure

The repository is organized into 9 distinct module directories:

*   **`00-syntax-semantics`**: Core language features, basic types, and standard evaluation.
*   **`01-recursion-functions`**: Tail-recursive algorithms and higher-order functions.
*   **`02-pattern-matching`**: Algebraic data types (ADTs) and deep pattern matching.
*   **`03-modules`**: Encapsulation using Signatures (`sig`) and Structures (`struct`).
*   **`04-imperative`**: Imperative features (references, mutable fields, and loops).
*   **`05-functors`**: Parameterized modules (Functors) for high-level code reusability.
*   **`06-oop-basics`**: Object-oriented design, classes, and basic methods.
*   **`07-oop-advanced`**: Advanced OOP, virtual classes, inheritance, and subtyping.
*   **`08-monads`**: Category theory concepts (Semigroups, Monoids, and Monads).

Each module folder contains subdirectories for individual exercises (e.g., `ex00/`, `ex01/`, `ex02/`...).

---

## 🛠 Compilation & Build System

Every module directory contains a custom `Makefile` designed to compile all its exercises using **`ocamlopt`** (the native-code OCaml compiler).

### Prerequisites

Ensure you have the OCaml native compiler installed:
```bash
ocamlopt -v
```

### Build Commands

To build and interact with any of the modules, navigate to the target module directory and use the following commands:

#### 1. Compile All Exercises
Compiles all exercises inside the module (e.g., `ex00` to `ex09`) into native executables (`out`) using `ocamlopt`:
```bash
make
```
*(This will also display a custom ASCII Camel upon successful compilation!)*

#### 2. Run All Exercises
Executes the compiled `out` binary for every exercise sequentially with formatted headers:
```bash
make run
```

#### 3. Clean Build Artifacts
Removes all intermediate compiler files (`.cmi`, `.cmo`, `.cmx`, `.o`, etc.):
```bash
make clean
```

#### 4. Full Clean
Removes all intermediate files as well as the compiled `out` executables:
```bash
make fclean
```

#### 5. Rebuild Everything
Performs a full clean and recompiles all exercises from scratch:
```bash
make re
```
