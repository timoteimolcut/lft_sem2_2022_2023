%{
#include "y.tab.h"
%}

%%
mul     { return MUL; }
div     { return DIV; }
add     { return ADD; }
sub     { return SUB; }
[0-9]+  { yylval.num = atoi(yytext); return NUMBER; }
\(      { return LPAREN; }
\)      { return RPAREN; }
\n      { return 0; }   // Ignoră newline
[ \t]   { }             // Ignoră spațiu și tab
.       { printf("Caracter nevalid: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}