%{
#include "y.tab.h"
%}

%%

[0-9]+      {yylval.number = atoi(yytext);
             return NUMBER;}
[a-zA-Z]     {yylval.variable = *yytext;
              return ID;}
do          {yylval.variable = *yytext; return DO;}
while        {yylval.variable = *yytext; return WHILE;}
[=+*><]       return *yytext;

[ \t\n]   ;
