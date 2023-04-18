%{
    #include "y.tab.h"
%}

%%

[0-9]+      {
                yylval = atoi(yytext);
                printf("lex: %d", yylval);
                return NUMBER;
            }
"+"         return '+';
"-"         return '-';
"*"         return '*';
"/"         return '/';




