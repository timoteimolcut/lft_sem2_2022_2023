%{
   #include "y.tab.h"
%}

NR [1-9][0-9]*

%%
{NR}	  		{	 
					//printf("value %s\n", yytext);
	    			yylval.nr=atoi(yytext);
            		return NR;
	  			}

j	  			return *yytext;      

[-+*=()\n]    	return *yytext;

[ \t]	  ;
. 	  			yyerror("Eroare de sintaxa\n");



%%
int yywrap(void) {
return 1;
}
