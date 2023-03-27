%{
#include "y.tab.h"
%}

%%

[0-9]+				{
					yylval.number = strdup(yytext);
					return INTEGER;
					}

[-+/*\n]			return *yytext;

[ \t]+          	;
