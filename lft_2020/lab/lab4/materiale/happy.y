%{
#include <stdio.h>
%}
%token BE DONT PADJ NADJ NNOUN FREE

%token A_ARTICLE AN_ARTICLE READABLE_A READABLE_AN READ

%%
stats : stats msg '\n' {printf(" good for you \n");}
      | /*epsilon*/
      | stats nmsg '\n' {printf("make a tiny change \n");}
      ;

msg : BE PADJ
    | DONT BE NADJ
    | BE NNOUN FREE
    | READ nominal
    ;

nominal : A_ARTICLE READABLE_A
		| AN_ARTICLE READABLE_AN
		| A_ARTICLE READABLE_AN {printf("study english grammar!!!\n");}
		| AN_ARTICLE READABLE_A {printf("study english grammar!!!\n");}
		;

nmsg : BE NADJ
     | DONT BE PADJ
     ;
     /* can we replace syntax error with a recommendation? */
