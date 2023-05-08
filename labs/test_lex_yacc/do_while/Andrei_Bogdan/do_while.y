%{
#include <stdio.h>
int yylex();
void yyerror();

typedef struct _node{
    char s[1000];

}node;

%}


%union { int number;
         char variable;
         struct _node *np;
         };


%token <number> NUMBER 
%token <variable> VAR

%left  '-'


%nonassoc DO
%nonassoc WHILE

%type <np> start line statemnet end 



%%

start : DO '\n' {
    
    printf("  DO") ;
            printf("\n");}
        |/* empty */ {}
        ;
end : WHILE statemnet'\n'
            
                {printf("WHILE \n %s",statemnet->c) ;
            printf(\n);}|
            ;
            
line : exp '\n'
        | statemnet '\n'
        ;
statemnet : exp '\n' {printf("%s", exp )}
            | DO statemnet WHILE statemnet '\n'{printf( "fdsf");}


exp : VAR '=' NUMBER '\n'
            {printf(" exp %c = %d",VAR,NUMBER);}
    | exp '-' exp
            {printf(" exp %c - %d",VAR,NUMBER);}
    | exp '>' exp
            {printf(" exp %c > %d",VAR,NUMBER);}
    | exp '<' exp
            {printf(" exp %c < %d",VAR,NUMBER);}
    ;











%%
void main(){
    printf("\nScanner has started\n\n");
    yyparse();
}


void yyerror()
{
    printf("\nUPS: found an error\n\n");
}

