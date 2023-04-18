%{
#include "y.tab.h"
%}

%%
[a-z]          ;
[01\n]           return *yytext;
    
