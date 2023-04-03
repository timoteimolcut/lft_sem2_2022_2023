%token INT ZERO

%{
#include <stdio.h>

int yylex();
void yyerror(const char *s);

%}



%%


program: program S '\n'
        |
        ;

S: '0' S '1'        {printf("Productia S->0S1 %d\n", yylval);}
  | /* epsilon */   {printf("Productia S->epsilon\n");}
  ;  
     