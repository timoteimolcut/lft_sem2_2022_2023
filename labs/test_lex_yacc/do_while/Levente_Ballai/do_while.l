%{
#include "y.tab.h"
%}

%%

"do"          { return DO; }
"while"       { return WHILE; }
">"           { yylval.operation = GREATER; return OP; }
"<"           { yylval.operation = LESS; return OP; }
">="          { yylval.operation = GREATER_EQUAL; return OP; }
"<="          { yylval.operation = LESS_EQUAL; return OP; }
"="           { yylval.operation = EQUAL; return OP; }
[a-zA-Z]+     { yylval.variable = yytext; return VAR; }
[0-9]+        { yylval.number = atoi(yytext); return NUM; }
":"           { return COLON; }
[-+*/()]      { return yytext[0]; }
[ \t\n]+      ;
.             { printf("Unknown character %c\n", yytext[0]); }

%%

int yywrap() {
    return 1;
}

