


%%
[ \t\n]				;
" "?[0-9]+/[ \t\n]?	printf("number: '%s'\n", yytext);
[^0-9 \t\n]+		printf("word: '%s'\n", yytext);
