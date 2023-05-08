%{
#include <stdio.h>
#include <stdlib.h>
void yyerror();
int yylex();
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

%token DO 
%token WHILE
%token <variable> ID
%token <number> NUMBER

%nonassoc DO
%nonassoc WHILE
%right '='
%type <np> prog do_while_stmt stmt exp conditie
%%
prog: prog stmt {printpre($2);}
    ;

do_while_stmt : DO stmt WHILE conditie ':'
          {printf("DO stmt WHILE\n");}
        ;

stmt : do_while_stmt 
     //| ID '=' NUMBER
     ;

exp : NUMBER { $$=setConst($1); }
    | ID  { $$=opr2(ID, opr2($1, NULL, NULL), NULL); }
    | exp '=' exp 
    ;

conditie : exp '>' exp 
         | exp '<' exp 
    ;

%%
void main()
{
    yyparse();
}
void yyerror(){printf("EROARE");}
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
       printf("%i ", opr->value);
    else
     {
      switch (opr->type ){
      case IF: printf("** IF "); break;
      case ID: printf("** Variable ");  break;
      default : printf(" ** %c ", opr->type);
      }
      printpre(opr->first);
      printpre(opr->second);
      printpre(opr->third);
      printf(" ** ");
     }
}