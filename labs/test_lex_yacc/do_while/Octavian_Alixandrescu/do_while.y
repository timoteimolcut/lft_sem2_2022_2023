%{
#include <stdio.h>
int yylex();
void yyerror();

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

%token <np> DO
%token <number> NUMBER 
%token <variable> ID


%nonassoc WHILE

%type <np> program line do_stmt stmt cond exp



%%

program : program line
            {
                printpre($2);
                printf("\n\n");
            }
        | /*nothing*/ {}
        ;

line    : exp '\n'
            {$$ = opr2('l', $1, NULL);}
        | do_stmt '\n'
            {$$ = opr2('l', $1, NULL);}
        | '\n'
            {$$ = opr2('l', NULL, NULL);}
        ;

do_stmt : DO stmt WHILE cond ':'
            {
                printf("Found do");
                $$ = opr2('i', $4, $2);
            }
        ;

stmt    : exp
            {$$ = opr2('e', $1, NULL);}
        | do_stmt
            {
                printf("found nested do");
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
        ;

%%

void main(){
    yyparse();
}

void yyerror()
{
    printf("\nfound an error\n\n");
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
      case DO: printf("( DO ");break;
      case ID: printf("( Variable ");  break;
      default : printf(" ( %c ", opr->type);
      }
      printpre(opr->first);
      printpre(opr->second);
      printpre(opr->third);
      printf(" ) ");
     }
 
}