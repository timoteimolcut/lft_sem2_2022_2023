%{
   #include <stdio.h>
   #include <string.h>
%}

%union{
    int num;
    char var;
    char* str;
}

%token DO WHILE
%token<num> NUMBER
%token<var> VARIABLE

%type<str> condition statement whilee while_statement
%%

program : program condition {printf("%s\n", $2);}
        | program whilee {printf("%s\n", $2);}
        |
        | program '\n' 
        ;

whilee :        DO '\n' while_statement WHILE condition '\n' {
                                                            $$ = (char*)malloc(1000);
                                                            sprintf($$, "do %s while %s", $3, $5);
                                                         }
while_statement : statement
                | whilee {printf("found imbricated while\n");}
                | statement whilee                        {
                                                            $$ = (char*)malloc(1000);
                                                            sprintf($$, "%s do_while: (%s)",$1, $2);
                                                          }
                ;
condition       : VARIABLE '>' NUMBER ':' 
                                                        {
                                                          $$ = (char*)malloc(1000);
                                                          sprintf($$, "%c%c%d%c", $1, '>', $3, ':');
                                                          //printf("%s\n", $$);
                                                        } 
                | VARIABLE '<' NUMBER ':' 
                                                        {
                                                         $$ = (char*)malloc(1000);
                                                         sprintf($$, "%c%c%d%c", $1, '<', $3, ':');
                                                         //printf("%s\n", $$);
                                                        }
                ; 

statement      : VARIABLE '=' NUMBER '\n'               {
                                                         $$ = (char*)malloc(1000);
                                                         sprintf($$, "%c%c%d", $1, '=', $3);
                                                        }


