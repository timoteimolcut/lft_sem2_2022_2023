%{
#include <stdio.h>
#include <stdlib.h>
int count = 0;
%}

%%

[a-zA-Z][a-zA-Z0-9]*   { /* ignoram variabile*/ }
[0-9]+                 { printf("%s\n", yytext); count++; }
[0-9]+\.[0-9]+         { /* ignoram numere reale*/ }
.                      { /* ignoram restul*/ }

%%

int main()
{
    yylex();
    printf("\nNumber of integer numbers : %d\n", count);
    return 0;
}