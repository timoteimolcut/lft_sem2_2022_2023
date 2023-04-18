%{
    #include "y.tab.h"
%}
%%
"if"            return IF;
"then"          return THEN;
"else"          return ELSE;
[a-zA-Z]+       {
                    yylval.variable = yytext;
                    return ID;
                }
[0-9]+          {
                    yylval.number = atoi(yytext);
                    return NUMBER;
                }
[\t ]+          ;

[\n=><\(\)]     return *yytext;


.           {printf("bug here ");}

