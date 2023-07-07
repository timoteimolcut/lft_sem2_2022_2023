%{
#include <stdio.h>
%}

%token NUMBER
%token MUL DIV ADD SUB
%token LPAREN RPAREN

%%
calc: /* empty */
    | calc expr '\n' { printf("%d\n", $2); }
    ;

expr: factor
    | expr MUL factor { $$ = $1 * $3; }
    | expr DIV factor { $$ =