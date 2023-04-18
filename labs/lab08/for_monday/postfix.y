%{
#include <stdio.h>
#include <string.h>
  char aux[100];

int yylex();
void yyerror(const char *);
%}

%union {char* svalue;}
%left '+' '-'
%left '*'

%token <svalue>INTEGER
%type <svalue> exp
%type <svalue> pr

%%
pr : pr exp '\n'{printf("Exp : %s\n .", $1);}
   | /* */
   ;

exp : INTEGER {strcpy($$, $1);}
    | exp exp '+'  {strcpy(aux, "("); strcat(aux, $1); 
                    strcat(aux, "+"); strcat(aux, $2);
                    strcat(aux, ")"); //$$=strdup(aux);
                     strcpy($$,aux);}
    |exp exp '-' {strcpy(aux, "("); strcat(aux, $1); 
                  strcat(aux, "-"); strcat(aux, $2);
                  strcat(aux, ")"); 
                  //$$=strdup( aux);
                  strcpy($$,aux);}
    ;
