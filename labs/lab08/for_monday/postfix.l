%{
#include "y.tab.h"
%}

%%
[-+*/]     return *yytext;
[0-9]+     {yylval.svalue = strdup(yytext) ; 
             //yylval.svalue=yytext;
            //strcpy(yylval.svalue, yytext);
             return INTEGER;}
\n         return *yytext;
[ \t]   ;
