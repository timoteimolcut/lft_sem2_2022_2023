
all:
	lex if_scanner.l
	yacc -d if_scanner.y
	gcc -o if_scanner lex.yy.c y.tab.c  -ll -ly

clean:
	rm lex.yy.c
	rm y.tab.*
	rm if_scanner