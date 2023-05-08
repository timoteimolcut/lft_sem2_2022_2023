%{
	#include <stdio.h>
	#include <stdlib.h>
	int indent = 0;
%}

%union {int num; char id;}
%token node
%token while
%token statement
%token condition
%token <num> number
%token <id> identifier
%%


node : 	while condition ':' 		{ 
     						for (int i = 0 ; i < indent; ++i)
    							printf("-");
					   	printf("While"); 
						indent += 4;
					}
     |	statement	      		{ 	
						for (int i = 0 ; i < indent; ++i)
							printf("-");
						printf("Statement");
					}
     |  condition		      	{	
						for (int i = 0 ; i < indent; ++i)
							printf("-"); 
						printf("Condition");
					}
     ;  

condition : number '>' number 	{ printf(">"); }
	  | number '<' number 	{ printf("<"); }
	  ;

statement : identifier '=' number { printf("="); }
	  ;

%%

