%{
#include <stdio.h>
int yylex();
void yyerror();
%}




%nonassoc '\n'

%left INTEGER 

%%

program : program line
        | /*empty*/
        ;

line    : '(' list ')' '\n'
                { printf("The sum is: %d\n", $2); }
        
        ;


list    : list INTEGER
                { $$ = $1 + $2; }
        | /*empty*/
                { $$ = 0; }
        ;


%%


void main(){
        yyparse();
}
