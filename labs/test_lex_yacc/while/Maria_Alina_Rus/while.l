%{
#include "y.tab.h"
%}

%%

"while"            { return WHILE; }
":"                { return COLON; }
">"                { return OPERATOR; }
"<"                { return OPERATOR; }
"="                { return ASSIGN; }
[[a-zA-Z]]+        { yylval.var = yytext[0]; return VARIABLE; }
[[[0-9]]+          { yylval.num = atoi(yytext); return NUMBER; }
[ \t\n]            ; /* skip whitespace */

.                  { yyerror("Invalid character"); }

%%

int yywrap(void) {
    return 1;
}
