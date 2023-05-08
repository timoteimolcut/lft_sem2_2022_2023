%{
#include "y.tab.h"
%}

%%
[<>:]        return *yytext;
-?[0-9]+      {yylval.number = atoi(yytext);
            return NUMBER;}
[a-zA-Z]     {yylval.variable = *yytext;
            return ID;}
do          return DO;
while        return WHILE;
[()=+*]       return *yytext;
[ \t\n]   ;
