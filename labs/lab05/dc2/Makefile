all:
	lex dc2.l
	yacc -d dc2.y 
	gcc -o dc2 lex.yy.c y.tab.c -ly -ll


clean:
	rm dc2
	rm lex.yy.c 
	rm y.tab.* 
