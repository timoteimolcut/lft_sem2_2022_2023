%{
#include "y.tab.h"
%}

%%

"do"                { return DO; }
"while"             { return WHILE; }
[a-zA-Z][a-zA-Z0-9]* { yylval.var = strdup(yytext); return VAR; }
[0-9]+              { yylval.intv = atoi(yytext); return INT; }
">"                 { return GREATER; }
"<"                 { return LESS; }
"="                 { return EQUALS; }
"\n"                {  }
[ \t]+              {  }
":"                 { return COLON; }
[;]                 { return SEMICOLON; }
"-"[0-9]+           { yylval.int_val = atoi(yytext); return INT; } 

.                   {  }

