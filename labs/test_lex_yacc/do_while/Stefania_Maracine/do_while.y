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
    } node;

node *opr2(int type, node * first, node *second);
node *opr3(int type, node * first, node *second, node *third);
node *setConst(int value);
void printpre(node *np);
%}


%union { int number;
         char variable;
         struct _node *np;}

%token DO WHILE
%token <variable> ID
%token <number> NUMBER
%type <np> do_while_stmt stmt exp cond


%left '+' '-'
%left '*' '/'


%%
prog: prog stmt {printpre($2);}
    | /* nothing */
    ;

do_while_stmt : DO stmt WHILE cond {$$ = opr2(DO, $2, $4); }
              ;

stmt : do_while_stmt
     | ID '=' exp {$$ = opr2('=', opr2(ID, opr2($1, NULL, NULL), NULL), $3); }
     |exp
     ;

exp : NUMBER {$$ = setConst($1);}
    | ID  {$$=opr2(ID, opr2($1, NULL, NULL), NULL);}
    | exp '+' exp {$$=opr2('+', $1, $3);}
    | exp '*' exp {$$=opr2('*', $1, $3);}
    | exp '-' exp {$$=opr2('-', $1, $3);}
    | exp '/' exp {$$=opr2('/', $1, $3);}
    ;
cond : exp '>' exp {$$=opr2('>', $1, $3);}
     | exp '<' exp {$$=opr2('<', $1, $3);}
     ;

%%
node *opr2(int type, node *first, node *second){
   node *p;
   p=(node*)malloc(sizeof(node));
   p->type= type;
   p->first=first;
   p->second = second;
   p->third = NULL;
   return p;
}

node *opr3(int type, node *first, node *second, node * third){
   node *p;
   p=(node*)malloc(sizeof(node));
   p->type= type;
   p->first=first;
   p->second = second;
   p->third = third;
   return p;
}

node *setConst(int value){
   node *p;
   p=(node*)malloc(sizeof(node));
   p->type= NUMBER;
   p->value=value;
   return p;

}

void printpre(node *opr){
    if (opr == NULL)
        return ;
    switch (opr->type){
        case DO:
            printf("( DO ");
            printpre(opr->first);
            printf(" WHILE ");
            printpre(opr->second);
            printf(" )\n");
            break;
        case ID:
            printf(" Variable ");
            printpre(opr->first);
            printpre(opr->second);
            break;
        case NUMBER:
            printpre(opr->second);
            printpre(opr->first);
            }
}
