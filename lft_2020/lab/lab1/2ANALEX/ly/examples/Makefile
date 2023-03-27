all:	lex yacc compile

lex:	scan.l
	lex scan.l

yacc:	gram.y
	yacc -d gram.y

compile: y.tab.c lex.yy.c
	 gcc -o small lex.yy.c y.tab.c -ly -ll

clean:	
	rm -rf y.tab.c y.tab.h lex.yy.c INTERPRETER
