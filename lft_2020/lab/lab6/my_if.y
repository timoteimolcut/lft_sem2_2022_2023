%{
#include <stdio.h>
#include <stdlib.h>

typedef struct _node{
	int token;
	int value;
	char var;
	struct _node *first;
	struct _node *second;
	struct _node *third;
}node;

	node* operand2(int token, node* first, node* second);
	node* operand3(int token, node* first, node* second, node* third);
	node* set_constant(int token, int value);
	node* set_variable(int token, char variable);
	void print_parse_tree(node* start);
%}

%union{
	int number;
	char variable;
	struct _node *np;
}

%token IF THEN ELSE NR ID EQOP INEQOP

%type <number> NR
%type <variable> ID 
%type <np> program statement if assign cond term

%nonassoc IFX
%nonassoc THEN ELSE


%%

program	:	/*nothing*/
			{print_parse_tree(NULL);}
		|	program statement '\n'
			{print_parse_tree($2);}
		;


statement	:	if
			|	assign
			;



if	:	IF '(' cond ')' THEN statement %prec IFX
		{ $$ = operand3(IF, $3, $6, NULL);}
	|   IF '(' cond ')' THEN statement ELSE statement
		{ $$ = operand3(IF, $3, $6, $8);}
	;


cond:	term '<' term
		{ $$ = operand2('<', $1, $3);}
	|	term '>' term
		{ $$ = operand2('>', $1, $3);}
	|	term EQOP term
	; 


assign	: ID '=' term
			{$$ = operand2('=', set_variable(ID, $1), $3);}
		;



term:	ID
		{$$ = set_variable(ID, $1);}
	|	NR
		{$$ = set_constant(NR, $1);}
	;


%%


node* operand2(int token, node* first, node* second){
	node* n = (node*)calloc(1, sizeof(node*));
	if(n == NULL){
		printf("No more memory");
		exit(1);
	}
	n->token = token;
	n->first = first;
	n->second = second;
	return n;
}


node* operand3(int token, node* first, node* second, node* third){
	node* n = (node*)calloc(1, sizeof(node*));
	if(n == NULL){
		printf("No more memory");
		exit(1);
	}
	n->token = token;
	n->first = first;
	n->second = second;
	n->third = third;
	return n;
}


node* set_constant(int token, int value){
	node* n = (node*)calloc(1, sizeof(node*));
	if(n == NULL){
		printf("No more memory");
		exit(1);
	}
	n->token = token;
	n->value = value;
	return n; 
}


node* set_variable(int token, char var){
	node* n = (node*)calloc(1, sizeof(node*));
	if(n == NULL){
		printf("No more memory");
		exit(1);
	}
	n->token = token;
	n->var = var;
	return n; 	
}


void print_parse_tree(node* start){
	if(start == NULL){
		return;
	} else if(start->token == NR){
		printf("%d\n", start->value);
	} else{
		switch(start->token){
			case IF: printf("IF\n"); 
					break;
			case ID: printf("var %c\n", start->var);
					break;
			default: printf("%c\n", start->token);
		}
		print_parse_tree(start->first);
		print_parse_tree(start->second);
		print_parse_tree(start->third);
	}
}