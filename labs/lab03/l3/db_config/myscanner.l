%{
#include "myscanner.h"
%}

%%

"db_type"				{return TYPE;}
"db_name"				{return NAME;}
"db_table_prefix" 		{return TABLE_PREFIX;}
"db_port"				{return PORT;}
:						{printf(" is set to "); return COLON;}
[ \t\n]					;

%%
int yywrap(void)
{
	return 1;
}
