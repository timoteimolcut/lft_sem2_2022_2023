%{
	#include <stdio.h>
	#include <stdlib.h>
	int variables[100];
	int assignValue(int varPos, int value);
%}


%token ID  NR  PRINT  EXIT


%left '+' '-'
%left '*' '/'
%left MINUS_UNAR


%%


program	: /* nothing */ 
		| program line '\n'
		;


line	:   PRINT 	expr ';'
			{printf("%d\n", $2);}
		|	EXIT ';'
			{exit(1);}
		|	assignment ';'
		|	/*nothing*/
		;


assignment  :	ID '=' expr
				{$$ = assignValue($1, $3);}
			|	ID '=' assignment
				{$$ = assignValue($1, $3);}				
			;

expr:	NR
	|	ID
		{$$ = variables[$1];}
	|	expr '+' expr
		{$$ = $1 + $3;}
	|	expr '-' expr
		{$$ = $1 - $3;}
	|	expr '*' expr
		{$$ = $1 * $3;}
	|	expr '/' expr
		{$$ = $1 / $3;}
	|	'-' expr %prec MINUS_UNAR
		{$$ = -$2;}
	;

%%

int assignValue(int varPos, int value){
	variables[varPos] = value;
	return value;
}