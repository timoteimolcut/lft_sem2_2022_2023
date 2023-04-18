%{
#include "y.tab.h"
%}

%%

[0-9]+ { yylval.ival = atoi(yytext); return NUMB; }

CONS return CONS;
APPEND return APPEND;
CAR return CAR;
CDR return CDR;

[()+'\n] return *yytext;

[ \t] ;
