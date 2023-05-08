%{
#include <stdio.h>
int yylex();
void yyerror();
// #include "if_functions.h"
typedef struct _node{
    int type;
    struct _node *first;
    struct _node *second;
    struct _node *third;
    int value;
} node;

node *opr2(int type, node *first, node *second);
node *opr3(int type, node *first, node *second, node * third);
node *setConst(int value);
void printpre(node *np);
%}

%union { int number;
         char variable;
         struct _node *np;}

%token <np> IF
%token <number> NUMBER 
%token <variable> ID

%left '+' '-'
%left '*' '/'

%nonassoc THEN
%nonassoc ELSE

%type <np> program line if_stmt stmt cond exp



%%

program : program line
            {
                printf("Done reading a line...\nPrinting it...\n");
                printpre($2);
                printf("\n\n");
            }
        | /* nothing */ {}
        ;

line    : exp '\n'
            {$$ = opr2('l', $1, NULL);}
        | if_stmt '\n'
            {$$ = opr2('l', $1, NULL);}
        | '\n'
            {$$ = opr2('l', NULL, NULL);}
        ;

if_stmt : IF cond THEN stmt
            {
                printf("done reading a simple if statement\n");
                $$ = opr2('i', $2, $4);
            }
        | IF cond THEN stmt ELSE stmt
            {
                printf("done reading a complete if statement\n");
                $$ = opr3('i', $2, $4, $6);
            }
        ;

stmt    : exp
            {$$ = opr2('e', $1, NULL);}
        | if_stmt
            {
                printf("done reading an imbrigated if\n");
                $$ = opr2('s', $1, NULL);    
            }
        ;

cond    : ID '>' NUMBER
           {$$ = opr2('>', opr2(ID, opr2($1, NULL, NULL), NULL), setConst($3));}
        | ID '<' NUMBER
            {$$ = opr2('<', opr2(ID, opr2($1, NULL, NULL), NULL), setConst($3));}
        ;




exp     : ID '=' NUMBER
            {   
                printf("Found an assignment: %c, %d\n", $1, $3); 
                $$ = opr2('=', opr2(ID, opr2($1, NULL, NULL), NULL), setConst($3));
            }
        | exp '+' exp
            {$$ = opr2('+', $1, $3);}
        | exp '-' exp
            {$$ = opr2('-', $1, $3);}
        | exp '*' exp
            {$$ = opr2('*', $1, $3);}
        | exp '/' exp
            {$$ = opr2('/', $1, $3);}
        ;


%%

void main(){
    printf("\nScanner has started\n\n");
    yyparse();
}


void yyerror()
{
    printf("\nUPS: found an error\n\n");
}



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