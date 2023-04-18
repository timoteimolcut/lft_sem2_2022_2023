%{
#include "y.tab.h"
%}

%%

         /*"<="|">="|"=="|"!=" return RELOP; */
">"        return *yytext;
[0-9]+      {yylval.number = atoi(yytext);
             return NUMBER;}
[a-zA-Z]     {yylval.variable = *yytext;
              return ID;}
if          return IF;
then        return THEN;
else        return ELSE;
[()=+*]       return *yytext;

[ \t\n]   ;
