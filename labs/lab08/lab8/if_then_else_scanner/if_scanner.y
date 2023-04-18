
%{
    #include <stdio.h>
    int yylex();
    void yyerror();
    // #include "if_functions.h"
%}

%union { int number;
         char* variable;
         struct node *np;}
%token IF
%token NUMBER 
%token ID

%left '+' '-'
%left '*' '/'

%nonassoc THEN
%nonassoc ELSE

%%

program : program line
            {printf("done reading a line...\n\n");}
        |
        ;

line    : exp '\n'
        | if_stmt '\n'
        | '\n'
        ;

if_stmt : IF cond THEN stmt
            {printf("done reading a simple if statement\n");}
        | IF cond THEN stmt ELSE stmt
            {printf("done reading a complete if statement\n");}
        ;

stmt    : ID '=' exp
            {printf("done reading an assignment\n");}
        | if_stmt
            {printf("done reading an imbrigated if\n");}
        ;

cond    : '>'
        | '<'
        ;




exp     : NUMBER    
            {printf("found a number: %d, %d\n", yylval.number, $<number>1); $<number>$=$<number>1;}
        | ID        
            {printf("found an id: %s, %s\n", yylval.variable, $<variable>1);}
        | exp '+' exp
        | exp '-' exp
        | exp '*' exp
        | exp '/' exp
        ;


%%

void main(){
    printf("\nscanner started\n\n");
    yyparse();
}


void yyerror()
{
    printf("\nUPS: found an error\n\n");
}