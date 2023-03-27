%%
[ \t]+$			printf("*");
[ \t]+			printf(" ");

[a-z]+				printf("'%s'", yytext);

