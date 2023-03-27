%token NR  
%left '+' '-'
%left '*'

%{
    void yyerror(char *s);
	#include <stdio.h>
extern FILE *yyin;
 %}     
	
%union {
    struct complex {
        int real;
        int imag;
    }C;
    int nr;
    }
%type <C> expresie; 
%type <nr> NR;

%%
program : program expresie '\n'  	     
            { printf("complex number: %d", $2.real);
              if($2.imag > 0){
                printf("+");
              }
              printf("%dj\n", $2.imag);}
        |   '\n'
            {printf("empty line\n");}
        |   /* empty */
        ;

expresie  :  expresie '+' expresie 	 
              {$$.real=$1.real+$3.real;
					     $$.imag=$1.imag+$3.imag;}

          |	 expresie '-' expresie		 
              {$$.real=$1.real-$3.real;
					     $$.imag=$1.imag-$3.imag;}

          |	 expresie '*' expresie		 
              {$$.real=$1.real*$3.real-$1.imag*$3.imag;
					     $$.imag=$1.real*$3.imag+$1.imag*$3.real;}

          |	 NR 'j' 			 
              {$$.real=0;$$.imag=$1;}

          |	 NR				 
              {$$.real=$1;$$.imag=0;}

          |	  '(' expresie ')'		 
              {$$=$2;}
          ;

%%

int main()
{
FILE *f = fopen("complex.txt", "r");
yyin = f;
return(yyparse());
yyparse();
return 0;
}

void yyerror(char *s)
{
printf(s);
}
