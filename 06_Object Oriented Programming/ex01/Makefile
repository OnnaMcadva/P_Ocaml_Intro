NAME = doctor_test
SOURCES = people.ml doctor.ml main.ml
OBJECTS = $(SOURCES:.ml=.cmx)
INTERFACE = $(SOURCES:.ml=.cmi)
O_FILES = $(SOURCES:.ml=.o)

CAMLC = ocamlopt
FLAGS = -w -a

all: $(NAME)

$(NAME): $(OBJECTS)
	$(CAMLC) $(FLAGS) -o $(NAME) $(OBJECTS)

%.cmx: %.ml
	$(CAMLC) $(FLAGS) -c $<

clean:
	rm -f $(OBJECTS) $(INTERFACE) $(O_FILES)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
