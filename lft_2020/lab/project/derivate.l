%{
	#include "y.tab.h"
%}


%%


[1-9][0-9]*				{
							yylval.val = atoi(yytext);
							return NR;
						}

x|X 					{
							return VAR;
						}

sin						{
							return SIN;
						}

[-+*()\n^]				return *yytext;

[ \t]					|
.						;
