%{
   #include "y.tab.h"
%}
%%
"do"        return DO;
"while"     return WHILE;
[\t ]+      ;
[a-zA-Z]+   {yylval.variable=yytext; return ID;}
[-]?[0-9]+      {yylval.number=atoi(yytext); return NUMBER;}
.           ;


