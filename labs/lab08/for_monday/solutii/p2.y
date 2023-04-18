%{

#include <stdio.h>
int yylex();
void yyerror(const char*);


%}

%token NUMBER
%start poli
%%
poli : monom
     | '-' monom
     | poli '+' monom
     | poli '-' monom
     ;

monom : coef 'x' grad
     ;

coef : NUMBER
     | 
     ;

grad : '^' NUMBER
     |
     ;
