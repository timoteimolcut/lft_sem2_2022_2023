%{
#include <stdio.h>
int yylex();
void yyerror();
%}
%union {
    int val;
    char id;
    char* str;
}

%left LT GT
%token WHILE NL ASSIGN
%token <val> VALUE
%token <id> ID 
%type <str> line loop assigment condtion

%%
line    : statement line { printf("read Line"); }
        | statement { printf("read Line"); }
        ; 
        
statement : assigment NL
            { printf("read Assignment"); }
        | loop ':'  NL 
            { printf("read Loop"); }
        ;
loop    : WHILE condtion statement
            { printf("read While"); }
        ;
condtion: ID LT VALUE { printf ("%c is less than %d", $1, $3); }
        | ID GT VALUE { printf ("%c is greater than %d", $1, $3); }
        ;
assigment   : ID ASSIGN VALUE { printf ("%c is now %d ",$1,$3); }
        ;



%%
int main()
{
    printf("Starting parser...\n ");
    return yyparse();
}

void yyerror()
{
    printf("\nError\n");
}


