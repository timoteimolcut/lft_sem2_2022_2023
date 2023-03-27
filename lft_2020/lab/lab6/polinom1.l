%{
#include "y.tab.h"
%}

NR 			[1-9][0-9]*

%%

[-+*^] 		{//ECHO;
			return *yytext;}

[Xx]		{//ECHO;
			return VAR;}

{NR} 		{
			//ECHO;
			yylval.number = atoi(yytext);
			return NR;
			}
.			|
\n 			;

%%
