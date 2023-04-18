%{

#include "y.tab.h"

%}

%%
[-+x^]     return *yytext;
[0-9]+    return NUMBER;
[ \n\t]    ;
.         ;
