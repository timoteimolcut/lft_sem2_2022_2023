%{

#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *);

typedef struct _node {
    int type;
    struct _node *first;
    struct _node *second;
    struct _node *third;
    int value;
    char variable;
} node;

node *opr2(int type, node *first, node *second);
node *opr3(int type, node *first, node *second, node *third);
node *setConst(int value);
node *setVar(char var);
void print_tree(node *np);

%}

%union {
    int number;
    char variable;
    char operation;
    node *np;
}

%token <number> NUM
%token <variable> VAR
%token <operation> OP
%token DO WHILE EQUAL GREATER LESS GREATER_EQUAL LESS_EQUAL COLON

%type <np> program stmt condition assignment

%%

program: program stmt { printpre($2); }
        |  /* empty */
        ;

stmt:   assignment
        | DO stmt WHILE condition COLON { $$ = opr2(DO, $2, opr2(WHILE, $4, NULL)); }

assignment: VAR EQUAL NUM { $$ = opr2('=', setVar($1), setConst($3)); }

condition: NUM GREATER VAR { $$ = opr2('>', setConst($1), setVar($3)); }
	   | NUM LESS VAR { $$ = opr2('<', setConst($1), setVar($3); }

%%

node *opr2(int type, node *first, node *second) {
    node *p = (node *)malloc(sizeof(node));
    p->type = type;
    p->first = first;
    p->second = second;
    p->third = NULL;
    return p;
}

node *setConst(int value){
   node *p;
   p = (node*)malloc(sizeof(node));
   p->type = NUM;
   p->value = value;
}

node *setVar(int value) {
   node *p;
   p = (node*)malloc(sizeof(node));
   p->type = VAR;
   p->value = value;
}

void print_tree(node *opr){
    if (opr == NULL)
       return ;
    if (opr->type == NUM)
       printf("%i ", opr->value);
    else
     {
      switch (opr->type ){
      case DO: printf(" DO ");break;
      case WHILE: printf(" WHILE ");  break;
      default : printf(" %c ", opr->type);
      }
      printpre(opr->first);
      printpre(opr->second);
      printpre(opr->third);
      printf("\n");
     }
}
