%{
    #include "y.tab.h"
%}
%%
"while"            return WHILE;
"then"             return THEN;

[a-zA-Z]       {
                    yylval.variable = yytext[0];
                    return ID;
                }
[0-9]+          {
                    yylval.number = atoi(yytext);
                    return NUMBER;
                }
[\t ]+          ;

[\n=><()+\-*/%]     return *yytext;


.   {printf("bug");}

