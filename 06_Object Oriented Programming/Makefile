OCAMLOPT	= ocamlopt
EXERCISES	= ex00 ex01 ex02 ex03 ex04

# Colors
DEF		= \033[0m
BOLD		= \033[1m
RED		= \033[1;91m
GREEN		= \033[1;92m
CYAN		= \033[1;96m
PINK		= \033[38;5;206m
YELLOW		= \033[38;5;226m
SAND		= \033[38;5;222m
BLUE		= \033[38;5;117m

all: $(EXERCISES) camel

$(EXERCISES):
	@echo "$(CYAN)$(BOLD)Compiling $@...$(DEF)"
	@srcs="$(notdir $(wildcard $@/*.mli)) $(notdir $(filter-out %/main.ml,$(wildcard $@/*.ml))) $(notdir $(filter %/main.ml,$(wildcard $@/*.ml)))"; \
	if [ -n "$$(echo $$srcs | xargs)" ]; then \
		cd $@ && $(OCAMLOPT) $$srcs -o out \
			&& echo "$(GREEN)  [ OK ] $@$(DEF)" \
			|| echo "$(RED)  [FAIL] $@$(DEF)"; \
	else \
		echo "$(YELLOW)  [SKIP] $@ has no ML sources yet$(DEF)"; \
	fi

camel:
	@echo ""
	@echo "$(SAND)$(BOLD)  '\|/'                                  $(YELLOW)*$(DEF)"
	@echo "$(SAND)$(BOLD) -- $(YELLOW)*$(SAND) -----$(DEF)"
	@echo "$(SAND)$(BOLD)   /|\\      ____$(DEF)"
	@echo "$(SAND)$(BOLD)  ' | '    {_   o^>       $(YELLOW)*$(DEF)"
	@echo "$(SAND)$(BOLD)    :        -_  /)$(DEF)"
	@echo "$(SAND)$(BOLD)    :         (   (        $(GREEN).-''\`'.$(DEF)"
	@echo "$(SAND)$(BOLD)    .          \\   \\      $(GREEN)/       \ \$(DEF)"
	@echo "$(SAND)$(BOLD)    .           \\    \\   $(GREEN)/         \ \$(DEF)"
	@echo "$(SAND)$(BOLD)                 \\    \`-'$(GREEN)           \`'.$(DEF)"
	@echo "$(SAND)$(BOLD)                  \\    . '        /    \`.$(DEF)"
	@echo "$(SAND)$(BOLD)                   \\  ( \\  )     (     .')$(DEF)"
	@echo "$(SAND)$(BOLD)    ,,   t          '. |  /       |     ($(DEF)"
	@echo "$(SAND)$(BOLD)   '|\`\`_/^\\___        '|  |\`'-..-'|   ( ()$(DEF)"
	@echo "$(BLUE)$(BOLD)_~~|~/_|_|__/|~~~~~~~~ |  / ~~~~~ |   | ~~~~~~~~$(DEF)"
	@echo "$(SAND)$(BOLD) -_  |L[|]L|/          | |\\ $(GREEN) 42 $(SAND)  )   )$(DEF)"
	@echo "$(BLUE)$(BOLD)                       ( |(       /  /|$(DEF)"
	@echo "$(BLUE)$(BOLD)   ~~ ~  ~~ ~~~~       | /\\\      / /| |$(DEF)"
	@echo "$(BLUE)$(BOLD)                       ||  \\\\   _/ / | |$(DEF)"
	@echo "$(SAND)$(BOLD)             ~ ~~ ~~~ _|| (_/ (___)_| |$(DEF)"
	@echo "$(SAND)$(BOLD)                     (__)         (____)$(DEF)"
	@echo ""
	@echo "$(BOLD)$(CYAN)<><><><><><><><><><><><><><><><><><><><><><><><><><>$(DEF)"
	@echo "$(BOLD)$(GREEN)  OCaml module 06 compiled! Run 'make run' to test.$(DEF)"
	@echo "$(BOLD)$(CYAN)<><><><><><><><><><><><><><><><><><><><><><><><><><>$(DEF)"
	@echo ""

run:
	@for ex in $(EXERCISES); do \
		if [ -f $$ex/out ]; then \
			echo "$(PINK)$(BOLD)=== $$ex ===$(DEF)"; \
			$$ex/out; \
			echo ""; \
		fi \
	done

clean:
	@echo "$(RED)$(BOLD)Cleaning compiled files...$(DEF)"
	@for ex in $(EXERCISES); do \
		rm -f $$ex/*.cmo $$ex/*.cmi $$ex/*.cmx $$ex/*.cmxa $$ex/*.o $$ex/*.a; \
	done

fclean: clean
	@echo "$(RED)$(BOLD)Removing executables...$(DEF)"
	@for ex in $(EXERCISES); do \
		rm -f $$ex/out $$ex/a.out; \
	done

re: fclean all

.PHONY: all run clean fclean re $(EXERCISES) camel
