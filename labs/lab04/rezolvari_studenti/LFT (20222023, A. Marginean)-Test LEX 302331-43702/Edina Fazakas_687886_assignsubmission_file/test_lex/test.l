%{
#include <stdio.h>
%}

%%
"="                 { printf("=");}
":"                 { printf(":");}
"++"                { printf(" INC ");}
"+"                 { printf(" ADD ");}
"-"                 { printf(" SUB ");}
"*"                 { printf(" MUL ");}
"/"                 { printf(" DIV ");}
"("                 { printf("(");}
")"                 { printf(")");}
"for"                { printf("FOR");}
"to"                 { printf("TO");}
"in"                 { printf("IN");}
"if"                 { printf("IF");}
"else"                { printf("ELSE");}
"<"                   { printf("<");}
">"                   { printf(">");}
[a-zA-Z][a-zA-Z0-9]* { printf("VAR");}
[_a-zA-Z]+"("         {printf("%s", yytext);}
[0-9]+              { printf("INT"); }
[0-9]+"."[0-9]*([DEde][-+]?[0-9]+)?   {printf("REAL");}
[ ]                 { printf(" ");}
[\t]                { printf("\t");}
[\n]                { printf("\n");} 
.                   ; 
%%

int main() {
    yylex();
    return 1;
}