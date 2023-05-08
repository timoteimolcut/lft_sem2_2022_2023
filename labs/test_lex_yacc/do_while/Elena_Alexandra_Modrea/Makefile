



all:
	lex do_while.l
	yacc -d do_while.y
	gcc lex.yy.c y.tab.c -ll -ly 

clean:
	rm lex.yy.c 
	rm y.tab.*
	rm a.out