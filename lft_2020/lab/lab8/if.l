%{
#include "y.tab.h"
%}

%%
if          return IF;
then        return THEN;
else        return ELSE; 
[0-9]+      {yylval.number= atoi(yytext);return NUMBER;}
[a-zA-Z]    {yylval.variable= *yytext;return ID;}
[=+><*();]  return *yytext;



