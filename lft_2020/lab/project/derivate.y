%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>

	int* createMonom(int coef, int power);
	char* monom_string(int* coefs);
	int* addMonoms(int* coefs1, int* coefs2);
	int* subMonoms(int* coefs1, int* coefs2);
	int* derivePolinom(int* coefs);
	char* deriveSinus(int* coefs);

	int* coefs;
%}

%union{
	int val;
	int* coefs;
	char* deriv;
}

%token NR VAR SIN 

%type <val> NR
%type <coefs> monom polinom
%type <deriv> function

%%

program	:  	/*nothing*/
		|  	program function	'\n'
			{printf("derivative: %s\n", $2);}
		;

function:  	polinom
			{printf("polinom ");
			$$ = monom_string(derivePolinom($1));}
		|  	SIN '(' polinom ')'
			{printf("sin ");
			$$ = deriveSinus($3);}
		; 


polinom	:	monom
			{$$ = $1;}
		|	polinom '+' monom
			{$$ = addMonoms($1, $3);}
		|	polinom '-' monom
			{$$ = subMonoms($1, $3);}
		;

monom	:	NR VAR '^' NR
			{$$ = createMonom($1, $4);}
		|	VAR '^' NR
			{$$ = createMonom(1, $3);}
		|	NR VAR
			{$$ = createMonom($1, 1);}
		|	VAR
			{$$ = createMonom(1, 1);}
		|	NR
			{$$ = createMonom($1, 0);}
		|	'-' NR
			{$$ = createMonom(-$2, 0);}
		;

%%

int* createMonom(int coef, int power){
	int* coefs = (int*)calloc(10, sizeof(int));
	if(coefs == NULL){
		printf("no more memory\n");
		exit(1);
	}
	coefs[power] = coef;
	return coefs;
}

char* monom_string(int* coefs){
	char* str = (char*)calloc(30, sizeof(char));
	char* inter = (char*)calloc(10, sizeof(char));
	for(int i = 9; i >= 0; i--){
		if(coefs[i] > 0){
			sprintf(inter, "+%dx^%d", coefs[i], i);
			strcat(str, inter);
		} else if(coefs[i] < 0){
			sprintf(inter, "%dx^%d", coefs[i], i);
			strcat(str, inter);
		}
	}
	free(inter);
	return str;
}


int* addMonoms(int* coefs1, int* coefs2){
	int* poli = createMonom(0, 0);
	for(int i = 0; i < 10; i++){
		poli[i] = coefs1[i] + coefs2[i];
	}
	return poli;
}

int* subMonoms(int* coefs1, int* coefs2){
	int* poli = createMonom(0, 0);
	for(int i = 0; i < 10; i++){
		poli[i] = coefs1[i] - coefs2[i];
	}
	return poli;
}


int* derivePolinom(int* coefs){
	int* n_coefs = (int*)calloc(10, sizeof(int));
	
	for(int i = 1; i < 10; i++){
		n_coefs[i-1] = coefs[i] * i;
	}
	n_coefs[9] = 0;

	return n_coefs;
}

char* deriveSinus(int* coefs){
	char* deriv = (char*)calloc(40, sizeof(char));
	strcpy(deriv, "cos(");
	strcat(deriv, monom_string(coefs));
	strcat(deriv, ")*(");
	strcat(deriv, monom_string(derivePolinom(coefs)));
	strcat(deriv, ")");
	return deriv;
}