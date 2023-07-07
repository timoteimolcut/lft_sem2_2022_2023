    #include "y.tab.h"
%%


[01]        {   
                yylval = atoi(yytext);
                return BINARY_CODE;
            }
["()]        return yytext[0];
and         return AND;

or          return OR;

not         return NOT;

.           ;
