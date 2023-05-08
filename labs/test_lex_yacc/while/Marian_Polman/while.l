%{
#include "y.tab.h"
%}

%%
while               { 
                        return BUCLA; 
                    }
[0-9]+              { 
                        yylval.num = atoi(yytext);
                        return INTEGER;      
                    }
[a-zA-Z]+           { 
                        yylval.var = strdup(yytext);
                        return VARIABLE; 
                    }
\n                  ;
[ \t]               ;
.                   {
                        printf("Invalid character: %s\n", yytext); 
                    }
%%

