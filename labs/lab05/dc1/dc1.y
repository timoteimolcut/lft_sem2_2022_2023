%token INTEGER
%{
#include <stdio.h>



int yylex ();
void yyerror ( const char * s );
%}  



%left '+' '-'
%left '*' '/'


%%

program : program expression '\n'
	     { printf("result is: %d\n", $2); }
        | /* NULL */
	;

expression : INTEGER
           | expression '+' expression
	        { $$ = $1 + $3; }
           | expression '-' expression
	        { $$ = $1 - $3; }
           | expression '*' expression
            { $$ = $1 * $3; }
           | expression '/' expression
            { $$ = $1 / $3; }
           ;
