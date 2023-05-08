
%{
    #include "y.tab.h"
%}
WORD        [a-zA-Z_]+
INTIGER     [1-9][0-9]*
%%
"while"     {
            printf("WHILE");
            return WHILE;
            }

{WORD}      {
            printf("VAR");
            yylval.variable = yytext;
            return VAR;
            }
{INTIGER}   {
            printf("INT");
            yylval.integer = atoi(yytext);
            return INT;
            }
:           {
            printf(":");
            return COLUMN;
            }
=           {
            printf("=");
            return ASIGN;
            } 
>           {
            printf(">");
            return COMP;
            }        
\<           {
            printf("<");
            return COMP;
            }                  

%%

yywrap(){
  return 1;
}