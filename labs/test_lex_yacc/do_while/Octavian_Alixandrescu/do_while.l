%{
    #include "y.tab.h"
%}
%%
"do"            return DO;
"while"          return WHILE;
[a-zA-Z]       {
                    yylval.variable = yytext[0];
                    return ID;
                }
[0-9]+          {
                    yylval.number = atoi(yytext);
                    return NUMBER;
                }
[\t ]+          ;

[\n=><()]     {return *yytext;}

