%{
/* Definition section */
#include<stdio.h>
int flag=0;
%}

%token NUMBER

%left '+' '-'

%left '*' '/' '%'

%left '(' ')'

/* Rule Section */
%%

// ArithmeticExpression: E{

// 		printf("\nResult=%d\n", $$);

// 		// return 0;

// 		};
E	:	E'+'E {$$=$1+$3;}
	|	E'-'E {$$=$1-$3;}
	|	E'*'E {$$=$1*$3;}
	|	E'/'E {$$=$1/$3;}
	|	E'%'E {$$=$1%$3;}
	|	'('E')' {$$=$2;}
	| 	NUMBER {printf("the number is: %d\n", $1);
				$$=$1;}

;

%%

// driver code
void main()
{
printf("\nprogram starting...\n\n");

yyparse();
// if(flag==0)
// printf("\nEntered arithmetic expression is Valid\n\n");
}

void yyerror()
{
printf("\nEntered arithmetic expression is Invalid\n\n");
flag=1;
}

