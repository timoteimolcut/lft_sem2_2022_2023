
    #include "y.tab.h"


%%
[0-9]+      { yylval = atoi(yytext); return NUMBER;}
while       { return WHILE;}
\>          { return GT;   }
\<          { return LT;   }
\=          { return EQ;   }
[-]?[a-zA-Z]+   { yylval = yytext;  return ID;}
.           {}
%%
