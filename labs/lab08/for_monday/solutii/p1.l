%{

#include "y.tab.h"

%}

%%
[{},]     return *yytext;
[0-9]+    return NUMBER;
.         ;
