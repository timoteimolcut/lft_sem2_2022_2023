
%%


a     |
ab    |
abc   |
abcd  {ECHO; REJECT;}
.		|
\n  	printf("'%c'", *yytext);
