%{
	#include "y.tab.h"
%}
%%
"while"				   { return while; }
[a-z]			   	   { yylval.id = yytext[0]; }
[0-9]+                             { yylval.num = atoi(yytext); }
[=<>:]				   { return yytext[0]; }
[ \t\n]                ;
.                      {ECHO; yyerror ("unexpected character");}
%%
int yywrap (void) {
	return 1;
}

