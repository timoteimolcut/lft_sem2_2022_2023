%{
#include "y.tab.h"
%}

%%
[ \t\n]              
[a-zA-Z][a-zA-Z0-9]* { yylval.string = strdup(yytext); return ID; }
[0-9]+               { yylval.integer = atoi(yytext); return INT; }
[:=]                 { return yytext[0]; }
[><=]+               { return yytext[0]; }
while                { return WHILE; }
.                    { return yytext[0]; }
%%

int yywrap() {
    return 1;
}
