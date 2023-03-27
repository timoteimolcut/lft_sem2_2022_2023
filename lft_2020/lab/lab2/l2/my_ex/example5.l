


D [0-9]+
%{
	int number;
%}

%%

{D}				{
					number = atoi(yytext);
					printf("%f\n", number/10.0);
				}				



(.)\n*			;


=-[a-zA-Z]		{
				printf("%s\n", yytext);
				yyless(yyleng-1);
				printf("%s\n", yytext);
				}	



