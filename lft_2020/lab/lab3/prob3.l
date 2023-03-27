	/*
	\"([^"]|\\\")*\"  printf("%s ", yytext);
	*/


%%

(a?){10}a{10}				printf("here: %d\n", yyleng);ECHO;

.*							;
