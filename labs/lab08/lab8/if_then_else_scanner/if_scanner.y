
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
        char* name;
    } node;

    node *opr2(int type, node *first, node *second);
    node *opr3(int type, node *first, node *second, node * third);
    node *setConst(int value);
%}

%union { int number;
         char* variable;
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
            {printf("done reading a line...\n\n");}
        | 
        ;

line    : exp '\n'
        | if_stmt '\n'
        | '\n'
        ;

if_stmt : IF cond THEN stmt
            {printf("done reading a simple if statement\n");}
        | IF cond THEN stmt ELSE stmt
            {printf("done reading a complete if statement\n");}
        ;

stmt    : ID '=' NUMBER
        | if_stmt
            {printf("done reading an imbrigated if\n");}
        ;

cond    : '>'
        | '<'
        ;




exp     : NUMBER    
            {   
                printf("found a number: %d, %d\n", yylval.number, $1); 
                // $$=$1;
                // $$ = setConst($1);
            }
        | ID 
            {   
                printf("found an id: %s, %s\n", yylval.variable, $1);
                // $$ = opr2('=', $1, $3);
            }
        | exp '+' exp
        | exp '-' exp
        | exp '*' exp
        | exp '/' exp
        ;


%%

void main(){
    printf("\nscanner started\n\n");
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