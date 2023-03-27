%{
#include <stdio.h>
#include <stdlib.h>
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
%}


%union { int number;
         char variable;
         struct _node *np;}

%token IF THEN ELSE 
%token <variable> ID
%token <number> NUMBER
%type <np> prog if_stmt stmt exp cond
%nonassoc IFX
%nonassoc ELSE
%left '+' 
%left '*'

%%
prog: prog stmt {printpre($2);}
    | /* nothing */
    ;

if_stmt : IF '(' cond ')'  THEN stmt %prec IFX
          {$$=opr2(IF, $3, $6);}
        | IF '(' cond ')'  THEN stmt ELSE stmt
          {$$=opr3(IF, $3, $6, $8);}
        ;
stmt : if_stmt 
     | ID '=' exp {$$=opr2('=', opr2($1,NULL, NULL), $3);} 
     |exp 
       ;

exp : NUMBER {$$=setConst($1);}
    | ID  {$$=opr2(ID, opr2($1, NULL, NULL), NULL);}
    | exp '+' exp {$$=opr2('+', $1, $3);}
    | exp '*' exp {$$=opr2('*', $1, $3);}
    ;
cond : exp '>' exp {$$=opr2('>', $1, $3);}
    ;

%%
node *opr2(int type, node *first, node *second){
   node *p;
   p=(node*)malloc(sizeof(node));
   p->type= type;
   p->first=first;
   p->second = second;
}

node *opr3(int type, node *first, node *second, node * third){
   node *p;
   p=(node*)malloc(sizeof(node));
   p->type= type;
   p->first=first;
   p->second = second;
   p->third = third;
}

node *setConst(int value){
   node *p;
   p=(node*)malloc(sizeof(node));
   p->type= NUMBER;
   p->value=value;

}
void printpre(node *opr){
    if (opr==NULL)
       return ;
    if (opr->type ==NUMBER)
       printf("%i", opr->value);
    else
     {
      switch (opr->type ){
      case IF: printf("( IF ");break;
      case ID: printf("( Variable ");  break;
      default : printf(" ( %c ", opr->type);
      }
      printpre(opr->first);
      printpre(opr->second);
      printpre(opr->third);
      printf(" ) ");
     }
 
}
