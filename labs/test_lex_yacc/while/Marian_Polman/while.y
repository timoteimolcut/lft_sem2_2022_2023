%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
int variables[100];
struct statement {
    int firstTherm;
    int operation;
    int secondTherm;
    int value;
};

%}

%union {
    char var;
    int num;
}

%token BUCLA INTEGER VARIABLE
%left '+' '-'
%left '*' '/'

%%

statement : INTEGER     {
                            $$ = $1;
                        }
          | VARIABLE '=' statement {
                                    variables[$1] = (*statement)($3)->value;
                                    $$ = (*statement)($3)->value;
                                  }
          | statement '+' statement {
                                        struct statement *stmt = malloc(sizeof(struct statement));
                                        stmt->firstTherm = $1 ;
                                        stmt->operation = 1;
                                        stmt->secondTherm = $3;
                                        stmt->value = $1 + $2;
                                        $$ = stmt;
                                    }
          | statement '-' statement {
                                        struct statement *stmt = malloc(sizeof(struct statement));
                                        stmt->firstTherm = $1 ;
                                        stmt->operation = 2;
                                        stmt->secondTherm = $3;
                                        stmt->value = $1 + $2;
                                        $$ = stmt;
                                    }
          | statement '*' statement {
                                        struct statement *stmt = malloc(sizeof(struct statement));
                                        stmt->firstTherm = $1 ;
                                        stmt->operation = 3;
                                        stmt->secondTherm = $3;
                                        stmt->value = $1 + $2;
                                        $$ = stmt;
                                    }
          | statement '/' statement {
                                        struct statement *stmt = malloc(sizeof(struct statement));
                                        stmt->firstTherm = $1 ;
                                        stmt->operation = 4;
                                        stmt->secondTherm = $3;
                                        stmt->value = $1 + $2;
                                        $$ = stmt;
                                    }
          ; 

while_statement: BUCLA condition ':' statement
                {
                    $$ = if($2);
                }

condition: VARIABLE '>' statement { $$ = variable[$1] > (*statement)($3)->value;}
         | VARIABLE '<' statement { $$ = variable[$1] < (*statement)($3)->value;}

%%


int main() {
    yyparse();
    return 0;
}

