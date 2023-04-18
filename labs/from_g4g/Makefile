

all:
	lex lex_file.l
	yacc -d yacc_file.y
	gcc lex.yy.c y.tab.c -ll -ly

clean:
	rm lex.yy.c
	rm y.tab.*
	rm a.out