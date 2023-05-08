%{
#include<stdio.h>
#include<stdlib.h>
%}

%token <integer> INT
%token <string> ID
%token WHILE
%left '+' '-'
%left '*' '/'



%%

int main() {
    
    yyparse();
    return 0;
}