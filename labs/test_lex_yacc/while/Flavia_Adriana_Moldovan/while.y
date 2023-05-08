%{
#include <stdio.h>
#include <stdlib.h>
%}

%union {
    char variable;
    int value;
}

%token WHILE VARIABLE INTEGER OP

%%

program:
    | program while_statement { }
    ;

while_statement:
    WHILE comparation OP statement { printf("while %c %c %d:\n", $2[0], $2[1],$4); }
    ;

comparation:
    expression OP expression {
        if ($2[0] == '<' || $2[0] == '>' || $2[0] == '=' || $2[0] == '!') {
            $$ = $2;
        }
        else {
            yyerror("Invalid operator");
        }
    }
    ;

expression:
    INTEGER { $$ = $1; }
    | VARIABLE { $$ = $1; }
    ;

statement:
    VARIABLE '=' expression { printf("%c = %d\n", $1, $3); }
    | while_statement { $$ = $1; }
    ;

%%

int main() {
    yyparse();
    return 0;
}