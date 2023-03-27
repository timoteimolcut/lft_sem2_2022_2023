

%%

%{
/*
12      printf("found 12\n");
12/34   {printf("found 1234\n"); REJECT;}

*/

%}


[^"]*   {
        if ( yytext[yyleng-1] == '\\' ){
            yymore();
            // yyless(1);
            // printf("\%s", yytext);

        } else {
            // printf("aha!");
        }
        }
  
