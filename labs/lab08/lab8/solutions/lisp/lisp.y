%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror();

typedef struct _cons {
  int car;
  struct _cons *cdr;
} cons_c;

cons_c *cons(int, cons_c *);
cons_c *concat(cons_c *, cons_c *);
cons_c *cdr(cons_c *);
int car(cons_c *);
void print_list(cons_c *);
void print_l(cons_c *);

%}

%union {
  int ival;
  struct _cons *list;
}

%token <ival> NUMB 
%token APPEND CAR CDR CONS 

%type <ival> i_form i_command
%type <list> l_form l_command enumm


%%

file      :    file line 
                    {printf("\n>");} 
          |    /* empty */ {}
          ;
line      :    form '\n' {}
          |    '\n' {}
          ;
form      :    i_form 
                    { printf("%d\n", $1); }
          |    l_form 
                    { print_list($1); }
          ;

i_form    :    '(' i_command ')' 
                    { $$ = $2; }
          |    NUMB 
                    { $$ = $1; }
          ;

i_command :    CAR l_form 
                    { $$ = car($2); }
          |    '+' i_form i_form 
                    { $$ = $2 + $3; }
          ;

l_form    :    '(' l_command ')' 
                    { $$ = $2; }
          |    '\'' '(' enumm ')' 
                    { $$ = $3; }
          ;

l_command :    CDR l_form 
                    { $$ = cdr($2); }
          |    CONS i_form l_form 
                    { $$ = cons($2, $3); }
          |    APPEND l_form l_form 
                    { $$ = concat($2, $3); }
          ;

enumm     :    NUMB enumm  
                    {$$ = cons($1, $2); }
          |    NUMB 
                    {$$ = cons($1, NULL);}
          ;

%%

void main(){
     printf("lisp starting...\n\n>");
     yyparse();
}

void yyerror(){
     printf("kaboom...\n");
}

cons_c *concat(cons_c *l1, cons_c *l2)
{
  cons_c *p;
  for(p = l1; p->cdr != NULL; p = p->cdr)
    ;
  p->cdr = l2;
  return l1;
}

cons_c *cons(int nr, cons_c *l)
{
  cons_c *p = (cons_c *)malloc(sizeof(cons_c));
  p->car = nr;
  p->cdr = l;
  return p;
}

cons_c *cdr(cons_c *l)
{
  return l->cdr;
}

int car(cons_c *l)
{
  return l->car;
}

void print_list(cons_c *l)
{
  printf("(");
  print_l(l);
  printf(")\n");
}

void print_l(cons_c *l)
{
  if(l != NULL) {
    if(l->cdr != NULL)
      printf("%d ", l->car);
    else
      printf("%d", l->car);
    print_l(l->cdr);
  }
}
