%{
#include "y.tab.h"
extern int yylval;
extern char *yytext;
%}

%%


[0-9]+              {
                        yylval = atoi(yytext);
                        return INTEGER;
                    }
[\n()]              return *yytext;
[ ,\t]              ;
