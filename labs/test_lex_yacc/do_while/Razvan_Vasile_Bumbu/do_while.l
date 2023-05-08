%{
#include "y.tab.h"
%}

%%
"do"        return DO;
"while"     return WHILE;

[a-zA-Z]    {
                yylval.id = yytext[0];
                return ID;
            }

[0-9]+      {
                yylval.value = yytext;
                return VALUE;
            }

[ ]+        ;

[\n]        ;

[\:=><()+\-*/%]   return *yytext;

.           { printf("Error"); }

