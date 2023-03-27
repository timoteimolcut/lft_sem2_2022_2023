%{
	#include "y.tab.h"
%}


%%

[a-zA-Z]		{
					yylval = *yytext - 'A';
					return ID;
				}

[0-9]+			{
					yylval = atoi(yytext);
					return NR;
				}

print			return PRINT;
exit			return EXIT;

[-+*/=\n;]  		{return *yytext;}



.				;


