%{
#include <stdio.h>
int yylex();
void yyerror();

typedef struct _node{
    int type;
    struct _node *first;
    struct _node *second;
    int value;
} node;

node *seteazaNod(int value);
node *op(int type, node *first, node *second);

void prettyprint(node *nodep);
%}

%union { char var;
         int nr;
         struct _node *nodep;}

%token <nodep> WHILE
%token <nr> VALUE 
%token <var> VARIABLE

%type <nodep> program line while_def statement cond expression


%%
program : program line
            {
                printf("Printing line: \n");
                prettyprint($2);
                printf("\n\n");
            }
        | /* empty */ {}
        ;

line    : expression '\n'
            {
                $$ = op('l', $1, NULL);
            }
        | while_def ':'
            {
                printf("Read while\n");
                $$ = op('l', $1, NULL);
            }
        | '\n'
            {
                $$ = op('l', NULL, NULL);
            }
        ;

while_def: WHILE cond statement
            {
                printf("Read while\n");
                $$ = op('w', $2, $3);
            }
        ;

statement    : expression
                    {
                        $$ = op('e', $1, NULL);
                    }
             | while_def
                    {
                        printf("While inside while\n");
                        $$ = op('s', $1, NULL);    
                    }
             ;

cond    : VARIABLE '>' VALUE
           {
            printf("Condition: %c  > %d\n", $1, $3); 
            $$ = op('>', op(VARIABLE, op($1, NULL, NULL), NULL), seteazaNod($3));
           }
        | VARIABLE '<' VALUE
           {
            printf("Condition: %c < %d\n", $1, $3); 
            $$ = op('<', op(VARIABLE, op($1, NULL, NULL), NULL), seteazaNod($3));
           }
        ;


expression     : VARIABLE '=' VALUE
            {   
                printf("Assignment: %c = %d\n", $1, $3); 
                $$ = op('=', op(VARIABLE, op($1, NULL, NULL), NULL), seteazaNod($3));
            }
        ;

%%

void main(){
    yyparse();
}
void yyerror()
{
}
node *op(int type, node *first, node *second){
   node *p;
   p=(node*)malloc(sizeof(node));
   p->type= type;
   p->first=first;
   p->second = second;
}
node *seteazaNod(int value){
   node *p;
   p=(node*)malloc(sizeof(node));
   p->type= VALUE;
   p->value=value;

}
void prettyprint(node *nod1){
    printf("AM AJUNS AICI");

    if (nod1->type ==VALUE)
       printf("%d ", nod1->value);
    else
     {
      switch (nod1->type ){
            case VARIABLE: printf("( Variable "); 
                 break;
            case WHILE: printf("( WHILE ");
                break;
            default : printf(" ( %c ", nod1->type);
      }
     }
 
}




