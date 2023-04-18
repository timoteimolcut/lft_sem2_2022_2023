%{
#include <stdio.h>

int yylex();
void yyerror(const char *s);

%}
%%
S: '0' S '1'        {printf("Productia S->0S1\n");}
  | /* epsilon */   {printf("Productia S->epsilon\n ");}
  ;  
     