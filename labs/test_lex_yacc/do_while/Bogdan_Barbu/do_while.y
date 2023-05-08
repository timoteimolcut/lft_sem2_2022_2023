%{
#include <stdio.h>
int yylex();
void yyerror(char *s);

typedef struct n{
    int type;
    struct n *first;
    struct n *second;
    struct n *third;
    int value;
} node;

node *generateNode2(int type, node *first, node *second);
node *generateNode3(int type, node *first, node *second, node * third);
node *generateNode0(int value);

void printpre(node *np);

%}

%union { 
        int number;
        char variable;
        struct n *np;
        }

%token DO WHILE 
%token <number> NUMBER 
%token <variable> ID

%type <np> program do_while_stmt stmt cond assign


%%
program : program do_while_stmt
            {
                printf("Am citit un do while\n");
                printpre($2);
            }
        |   {}
        ;

do_while_stmt   : DO stmt WHILE cond ':'
                    {$$ = generateNode2(WHILE, $2, $4);}
                ;

assign : ID '=' NUMBER
            {$$ = generateNode2('=', generateNode2(ID, NULL, NULL), generateNode0($3));}
        ;

stmt  :  do_while_stmt
            {$$ = $1;}
    | assign
        {$$ = $1;}
    | stmt do_while_stmt
        {$$ = generateNode2('s', $1, $2);}
    | stmt assign
        {$$ = generateNode2('s', $1, $2);}
    | {}
    ;


cond  :  ID '<' NUMBER
            {$$ = generateNode2('<', generateNode2(ID, NULL, NULL), generateNode0($3));}
      |  ID '>' NUMBER
            {$$ = generateNode2('>', generateNode2(ID, NULL, NULL), generateNode0($3));}
      | ;


%%

void main(){
    yyparse();
}


void yyerror(char *s)
{
    printf("\n%s\n",s);
}

node *generateNode2(int type, node *first, node *second){
    node *p;
   p=(node*)malloc(sizeof(node));
   p->type= type;
   p->first=first;
   p->second = second;
   p->third = NULL;
   return p;
}

node *generateNode3(int type, node *first, node *second, node * third){
    node *p;
   p=(node*)malloc(sizeof(node));
   p->type= type;
   p->first=first;
   p->second = second;
   p->third = third;
   return p;
}

node *generateNode0(int value){
    node *p;
   p=(node*)malloc(sizeof(node));
   p->type= NUMBER;
   p->value=value;
   p->first=NULL;
   p->second = NULL;
   p->third = NULL;
   return p;
}

void printpre(node *n){
    if (n == NULL){
       return ;
    }
    if (n->type == NUMBER){
       printf("%d ", n->value);
       return;
    }
    else
     {
      switch (n->type ){
      case WHILE: printf("WHILE(");break;
      case ID: printf("VAR",n->type);  return;
      default : printf(" %c ( ", n->type);
      }
      if(n->first){
      printpre(n->first);
      }
      if(n->second){
        printf(",");printpre(n->second);
      }
      
      if(n->third){
        printf(",");
        printpre(n->third);
      }
      printf(" ) ");
     }
 
}

     