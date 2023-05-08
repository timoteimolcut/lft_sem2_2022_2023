
%{
#include <stdio.h>

int yylex();
void yyerror(const char *s);

%}

%token ID NUMBER
%right WHILE
%right EQ
%left LT GT

%start stmt
%%
stmt : WHILE comp stmt  {
                            printf("Proceeding with while statement!");
                            if($2 == 1) $$ = $3;
                            else $$ = -1;
                        }
     | ID EQ NUMBER     {   
                            printf("Asigning %d to variable!", $3);
                            $1 = $3; 
                            $$ = $3;
                        }
     ;

comp : ID GT NUMBER {
                        printf("Compare %d to variable!", $3);
                        if($1 > $3) $$ = 1;
                        else $$ = 0;
                    }
     | ID LT NUMBER {
                        printf("Compare %d to variable!", $3);
                        if($1 < $3) $$ = 1;
                        else $$ = 0;
                    }
     ;
