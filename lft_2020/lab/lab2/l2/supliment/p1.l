


S[+-]
D[0-9]

%%


{S}?{D}+	{
				if(yytext[0] == '-'){
					printf("negativ\n");
				} else {
					printf("pozitiv\n");
				}
			}

.			|
\n 			;
			
