%{

#include <stdio.h>

int yylex();
void yyerror(const char *s);

%}

%token DING DONG DEL


%%
rima : sunet loc  {printf("rima -> sunt loc\n ");} 
     ;
sunet : DING DONG {printf("sunet -> ding dong \n ");}

      ;
loc   : DEL   {printf("loc -> del\n ");}

      ;


