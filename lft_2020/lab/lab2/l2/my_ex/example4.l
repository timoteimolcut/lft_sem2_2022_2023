%%

" "		|
"\t"	|
"\n"	;

a			{
				if(yytext[yyleng-1] == 'a'){
					printf("\n1 %s\n", yytext);
					yymore();
				} else {
					printf("\n2 %s\n", yytext);
				}
			}


b			printf("\n2 %s\n", yytext);





