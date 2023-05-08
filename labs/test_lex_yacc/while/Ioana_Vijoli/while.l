%{
    #include "y.tab.h"
%}
%%
"while"         return WHILE;


[a-zA-Z]        {
                    yylval.var = yytext[0];
                    return VARIABLE;
                }
-?[0-9]+          {
                    yylval.nr = atoi(yytext);
                    return VALUE;
                }
[><=]	        return *yytext;
[\t :]+          ;     	

.               {printf("Bug, you shouldn't be here!");}

