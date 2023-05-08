%{
  void yyerror (char *s);
  #include <stdio.h>     
  #include <stdlib.h> 
%}
%token INTEGER
%token ID
%token WHILE
    /*%left '+' '-'
    %left '*' '/' */
  
%precedence ':'
%precedence WHILE

%%
program : program statement '\n'
		 { printf(""); }
        | /* NULL */
        | program '\n' {}
	;

statement : ID '=' INTEGER {$$ = $3;}
          | WHILE condition ':' '\n' statement {printf("WHILE(%d)", $5); $$ = $5 * 10;}
	  ;
condition : ID '<' INTEGER {}
          | ID '>' INTEGER {}
          ;
           
%%
void yyerror (char *s) {fprintf (stderr, "%s\n", s);}
int main(){
 printf("code>\n");
 yyparse();
}
