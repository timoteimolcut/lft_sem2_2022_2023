%{

#include <stdio.h>
int yylex();
void yyerror(const char*);
int nr;
%}

%token NUMBER

%%

set: '{' enum '}'         {printf("set -> { enum }\n");
                           printf("Numar elemente %d",nr);}
    | '{''}'
   ;

enum : enum ','  elem     {printf("enum->enum , elem\n"); nr=nr+1;}
     |elem                {printf("enum -> elem\n"); nr =nr+1;}
     ;

elem : NUMBER             {printf("elem -> number\n");}
     ;