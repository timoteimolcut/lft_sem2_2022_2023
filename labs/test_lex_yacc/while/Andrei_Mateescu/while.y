%{
#include <stdio.h>
int yylex();
void yyerror();

typedef struct _node{
    int type;
    struct _node* first;
    struct _node* second;
    int value;
} node;

node *opr2(int type, node* first, node* second);

node *setConst(int value);

void printpre(node* np);

%}

%union { int number;
         char variable;
         struct _node *np;}

%token <np> WHILE
%token <number> NUMBER 
%token <variable> ID

%left '+' '-'
%left '*' '/'

%nonassoc THEN



%type <np> program line while_stmt stmt cond exp


%%

program : program line
            {
                printf("Done reading...\n");
                printpre($2);
                printf("\n");
            }
        | /* nothing */ {}
        ;

line    : exp '\n'
            {$$ = opr2('l', $1, NULL);}
        | while_stmt '\n'
            {$$ = opr2('l', $1, NULL);}
        | '\n'
            {$$ = opr2('l', NULL, NULL);}
        ;

while_stmt : WHILE cond THEN stmt
            {
                printf("read while\n");
                $$ = opr2('i', $2, $4);
            }
           ;

stmt    : exp
            {$$ = opr2('e', $1, NULL);}
        | while_stmt
            {
                printf("done reading a double while\n");
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
                printf("Foundassigment: %c, %d\n", $1, $3);
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

void main() {
    printf("\nScanner has started:\n");
    yyparse();
}

void yyerror() {
    printf("\nUPS: Error\n");
}

node *opr2(int type, node* first, node* second) {
   node* p;
   p = (node*)malloc(sizeof(node));
   p->type = type;
   p->first = first;
   p->second = second;
}

node *setConst(int value) {
   node* p;
   p = (node*)malloc(sizeof(node));
   p->type = NUMBER;
   p->value = value;
}

void printpre(node* opr) {
    if (opr == NULL) return;
    if (opr->type == NUMBER)
       printf("%i ", opr->value);
    else {
      switch (opr->type) {
      case WHILE: printf("( WHILE "); break;
      case ID: printf("( Variable "); break;
      default: printf("( %c ", opr->type); }
      printpre(opr->first);
      printpre(opr->second);
      printf(") ");
     }
 
}