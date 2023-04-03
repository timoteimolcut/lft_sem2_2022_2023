all:
	lex first.l
	yacc -d first.y 
	gcc -o first lex.yy.c y.tab.c -ly -ll


clean:
	rm first
	rm lex.yy.c 
	rm y.tab.* 
