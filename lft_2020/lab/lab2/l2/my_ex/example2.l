%%
ab|cdef				printf("here: %s\n", yytext);
[A-Za-z][A-Za-z0-9]*	printf("'%s' -- %d\n", yytext, yyleng);
[ \t\n]					;

