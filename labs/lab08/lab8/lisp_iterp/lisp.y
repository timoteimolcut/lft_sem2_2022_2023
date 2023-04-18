
%{
#include <stdio.h>

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

   /* your code here
    1. define tokens and their types from union
    2. define type for list or int nonterminals: l_form, i_form...*/
%token APPEND CAR CDR CONS NUMB

%%

file : file form '\n'
     | file '\n'
     | /* empty */
     ;

form : i_form { }//printf("%d\n", $1); }
     | l_form {}// print_list($1); }
     ;

i_form : '(' i_command ')' { /* your code here: i_command is a list which evaluates to an int */ }
       | NUMB //{ $$ = $1; }
       ;

i_command : CAR l_form { /* your code here */ }
          | '+' i_form i_form { /* your code here */ }
          ;

l_form : '(' l_command ')' { /* your code here */ }
          | '\'' '(' enum ')' { /* your code here */ }
          ;

l_command : CDR l_form { /* your code here */ }
          | CONS i_form l_form { }//$$ = cons($2, $3); }
          | APPEND l_form l_form {}/* your code here */ 
          ;

enum : NUMB enum {} //$$ = cons($1, $2); }
     | NUMB {} //$$ = cons($1, NULL); }
     ;

%%

/* Your code here 
-  functions for concat, cons, cdr, car, print_list from test_cons*/
