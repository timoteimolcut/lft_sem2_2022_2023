all:
	lex lisp.l
	yacc -d lisp.y
	gcc -o lisp lex.yy.c y.tab.c -ll -ly

clean:
	rm lex.yy.c
	rm y.tab.*
	rm lisp