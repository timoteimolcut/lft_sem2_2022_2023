



all:
	lex while.l
	yacc -d while.y
	gcc lex.yy.c y.tab.c -ll -ly 

clean:
	rm lex.yy.c 
	rm y.tab.*
	rm a.out