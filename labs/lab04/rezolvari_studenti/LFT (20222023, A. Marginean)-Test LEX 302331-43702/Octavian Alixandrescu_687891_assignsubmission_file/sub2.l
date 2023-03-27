%{include <stdio.h>

int yynr_intregi = 0;
%}
%%

[0-9]+"."[0-9]* {
    printf("REAL");}

[1-9][0-9]*  {
    printf("INT");
    yynr_intregi++;}
"for"             {printf("FOR");}
"in" {printf("IN");}
"if" {printf("IF");}
"else" {printf("ELSE");}
[+] {printf("ADD");}
"-" {printf("MINUS");}
"*" {printf("MULTIPLY");}
"/" {printf("DIVISION");}
[^(^ ][a-z][^a-z^)^ ] { printf("VAR");}
%%
int main(void){
    yylex();
    printf("Numarul de numere intregi din text este %d",yynr_intregi);
}