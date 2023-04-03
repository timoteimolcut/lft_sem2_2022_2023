%token INTEGER VARIABLE


%{
#include <stdio.h>
#include "y.tab.h"
int yylex ();
void yyerror ( const char * s );

static int variables[26];
%}

%%

program : program statement '\n'
        | program error '\n' { yyerrok; }
        | /* NULL */
	;

statement : expression  { printf("%d\n", $1); }
          | VARIABLE '=' expression  { variables[$1] = $3; }
          ;

expression : INTEGER
           | VARIABLE	 { $$ = variables[$1]; }
           | expression '+' expression { $$ = $1 + $3; }
           | expression '-' expression { $$ = $1 - $3; }
           | expression '*' expression { $$ = $1 * $3; }
           | expression '/' expression { $$ = $1 / $3; }
           | '(' expression ')' { $$ = $2; }
           ;

%%

void yyerror(char const *s)
{
    printf("yyerror  %s\n",s);
    return ;
}