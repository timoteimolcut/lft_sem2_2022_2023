%{
#include <stdio.h>
#include <stdlib.h>
#include "node.h"
%}

%token WHILE IF ELSE COLON ASSIGN COMP_OP LPAREN RPAREN PLUS MINUS TIMES DIV MOD CONSTANT ID

%left PLUS MINUS
%left TIMES DIV MOD
%right UNARY_MINUS
%nonassoc COMP_OP


%%
program : stmt_list { print_tree($1); }
        ;

%%
#include "node.c"

void yyerror(const char *s) {         
    fprintf(stderr, "%s\n", s);             
}

int main() {
    yyparse();
    return 0;
}
int main(){
    yyparse();
    return 0;
}
int main(){
    yyparse();
    return 0;
}

 

