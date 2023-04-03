all:
	lex dc1.l
	yacc -d dc1.y 
	gcc -o dc1 lex.yy.c y.tab.c -ly -ll


clean:
	rm dc1 
	rm lex.yy.c 
	rm y.tab.* 
