

all:
	lex myscanner.l
	gcc myscanner.c  lex.yy.c  -ll -o myscanner

clean:
	rm lex.yy.c
	rm a.out
