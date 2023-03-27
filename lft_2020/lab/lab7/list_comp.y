%{
	#include <stdio.h>
	#include <stdlib.h>
	typedef struct{
		char oper;
		int factor;
	}Expres;

	Expres mainExp;

	Expres createExp(char oper, int factor);
	int returnNewValue(int value);

%}
%token NR VAR FOR IN

%left '+' '*'

%union{
	int number;
}

%type <number> expr list NR

%%

program : /*nothing*/
		| program compreh '\n'
			{printf("]\n");}
		;

compreh : '['  expr  FOR  VAR  IN  '[' list ']' ']'
	  	;


list :  /*nothing*/
		{}
	 |  NR
	 	{printf("[%d", returnNewValue($1));}
	 |  list ',' NR
	 	{printf(", %d", returnNewValue($3));}
	 ;


expr :   NR
		{mainExp = createExp('_', $1);}
	 |   VAR
	 	{mainExp = createExp('*', 1);}
	 |   VAR '+' NR
	 	{mainExp = createExp('+', $3);}
	 |   NR '*' VAR
	 	{mainExp = createExp('*', $1);}
	 ;


%%

Expres createExp(char oper, int factor){
	Expres exp = {oper, factor};
	return exp;
}


int returnNewValue(int value){
	switch(mainExp.oper){
		case '_': return mainExp.factor;
		case '+': return mainExp.factor + value;
		case '*': return mainExp.factor * value;
		default: return value;
	}
}

