	#include "y.tab.h"

NR 			[0-9]+(","[0-9]+)?

%%
{NR}			{
					yylval.number = atof(yytext);
					return CONST;
				}

sin 			return SIN;

cos 			return COS;

x				return X;


for				return FOR;
[a-df-wyz]			{
					yylval.variable = *yytext;
					return VAR;
				}
in 				return IN;
to 				return TO;
by				return BY;


pi				return PI;
e 				return E;

if 				return IF;
"else"			return ELSE;

[-+*/%^()\:\=\t\n<>]	return *yytext;

";\n"			return COMA;

";"				return *yytext;


draw			return DRAW;


[ ]				|
.				;
