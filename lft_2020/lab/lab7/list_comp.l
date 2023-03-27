%{
	#include "y.tab.h"
%}



%%


[1-9][0-9]*				{
							yylval.number = atoi(yytext);
							return NR;
						}


x						return VAR;

for						return FOR;

in 						return IN;

[\,*+\n\[\]]			return *yytext;

[ \t]					;
