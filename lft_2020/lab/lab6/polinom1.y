%{
#include<stdio.h>
#include <ctype.h>
#include "y.tab.h"
  void init(int x[10]);
  void aduna (int a[10],int b[10],int c[10]);
  void tiparire(int c[10]);
%}

%union{
  int number;
  int coefs[10];
}

%token VAR NR
%type <number> NR
%type <coefs> polinom
%type <coefs> monom
%left '+' '-'


%%

pornire : /*vida*/
        | pornire polinom 
          {tiparire($2);}
        ;

polinom : monom '+' monom 
          {init($$);aduna($1, $3, $$);}
        | monom 
          {init($$);aduna($1, $$, $$);}
        ;

monom : NR 
          {init($$);$$[0]=$1;}
      | NR '*' VAR '^' NR 
          {init($$);$$[$5]=$1;}
      | VAR '^' NR 
          {init($$);$$[$3]=1;}
      | VAR 
          {init($$);$$[1]=1;}
      | NR '*' VAR 
          {init($$);$$[1]=$1;}
      ;

%%

void init (int x[10]) {
  for(int i=0;i<10;i++)
    {x[i]=0;}
}

void aduna (int a[10],int b[10],int c[10]) {
  for(int i=0;i<10;i++) {
      c[i]=a[i]+b[i];
    }
}


void tiparire(int c[10]) {
  for(int i = 9; i >= 0; i--) {
      if(c[i] != 0){
        printf("%d X ^ %d\n",c[i], i);
      }
    }
}



int yyerror(char *s) {
  printf("%s\n",s);
  return 0;
}

int main(void) {
  yyparse();
  return 0;
}
