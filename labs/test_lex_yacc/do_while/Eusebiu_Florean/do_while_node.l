%{
   #include "y.tab.h"
%}

%%

"do"          return DO;

"while"       return WHILE;

[A-Za-z]    {
                yylval.var = yytext[0];
                return VARIABLE;
            }

[-]*[0-9]+       {
                yylval.num = atoi(yytext);
                return NUMBER;
            }

[:><=\n]      return *yytext;

[ ]          ;

.            yyerror("oops, error\n");
