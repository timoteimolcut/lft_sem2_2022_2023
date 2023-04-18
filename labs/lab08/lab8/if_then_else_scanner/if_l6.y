%{
#include <stdio.h>
#include <stdlib.h>
/*uncomment the parts you think you need
typedef struct _node {
     int type;
     struct _node *first;
     struct _node *second;
     struct _node *third;
     int value;
    } node;

node *opr2(int type, node * first, node *second);
node *opr3(int type, node * first, node *second, node *third);
node *setConst(int value);
void printpre(node *np);
*/
%}


%union { int number;
         char variable;
         struct _node *np;}

%token IF THEN ELSE 
%token <variable> ID
%token <number> NUMBER

%nonassoc IFX
%nonassoc ELSE
%left '+' 
%left '*'

%%
prog: prog stmt {/*printpre($2);*/}
    | /* nothing */
    ;

if_stmt : IF '(' cond ')'  THEN stmt %prec IFX
          {/*your code here */}
        | IF '(' cond ')'  THEN stmt ELSE stmt
          {/*your code here */}
        ;
stmt : if_stmt 
     | ID '=' exp {/*your code here */} 
     |exp 
       ;

exp : NUMBER {/*$$=setConst($1);*/}
    | ID  {/*$$=opr2(ID, opr2($1, NULL, NULL), NULL);*/}
    | exp '+' exp {/*your code here*/}
    | exp '*' exp {/*your code here*/}
    ;
cond : exp '>' exp {/*your code here*/}
    ;

%%
/*your code here:
include functions from if_functions.c which are needed */
