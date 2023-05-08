%{
#include "y.tab.h"
extern int yylval;
%}

%%

[0-9]+	{
		yylval = atoi(yytext);
		return INTEGER;
	}
	
"while" return WHILE;

[a-zA-Z][a-zA-Z0-9]* return ID;

[-+/*=><:\n]	return *yytext;

[ \t]+          ;
