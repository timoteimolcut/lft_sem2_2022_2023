%{
    #include "y.tab.h"
%}
%%
"while"            return WHILE;
"do"          return DO;
[a-zA-Z]       {
                    yylval.variable = yytext[0];
                    return VAR;
                }
[0-9]+          {
                    yylval.number = atoi(yytext);
                    return NUMBER;
                }
[\t ]+          ;

[\n=>:<-]     return *yytext;




