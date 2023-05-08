%{
    #include <stdio.h>
    void yyerror();
    int yylex();
%}

%union { int integer;
         char* variable;
        }
%token WHILE 
%token VAR
%token INT
%token COLUMN
%token ASIGN 
%token COMP

%%

program : program line
        |
        ;
line    : WHILE VAR COMP INT COLUMN'\n'
        | ASIGN'\n'
        ;


%%
void main(){
    yyparse();
}

void yyerror(){
    printf("BUUUUG");
}