%{
  #include <stdio.h>
  #include <string.h>
  char infix[10];
%}


%token INTEGER
%left '+' '-'
%left '*' '/'

%union{
  char *number;
}

%type <number> INTEGER expr


%%

program :   /* NULL */
        |   program expr '\n'
              { printf("%s\n", $2); }
        ;

expr  :  INTEGER
      | expr expr '+'
          { 
            strcpy(infix, "(");
            strcat(infix, strdup($1));
            strcat(infix, " + ");
            strcat(infix, strdup($2));
            strcat(infix, ")");
            strcpy($$, infix);
          }
      | expr expr '-'
          { 
            strcpy(infix, "(");
            strcat(infix, strdup($1));
            strcat(infix, " - ");
            strcat(infix, strdup($2));
            strcat(infix, ")");
            strcpy($$, infix);
          }
      | expr expr '*'
          { 
            strcpy(infix, "(");
            strcat(infix, strdup($1));
            strcat(infix, " * ");
            strcat(infix, strdup($2));
            $$ = strcat(infix, ")");
          }
      | expr expr '/'
          { 
            strcpy(infix, "(");
            strcat(infix, strdup($1));
            strcat(infix, " / ");
            strcat(infix, strdup($2));
            $$ = strcat(infix, ")");
          }
      ;
