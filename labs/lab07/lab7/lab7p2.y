
%{
    #include <stdio.h>
%}


%token IF ID NUM THEN ELSE
%start if_statement

%%

if_statement   :  IF cond THEN assign
                    { $$ = node('IF', $2, S4);}
               |  IF cond THEN assign ELSE assign
                    { $$ = node('IF', $2, S4, $6);}
               ; 


assign  : ID '=' term
        ;


cond : '(' term '<' term ')'
        {printf("ok\n");}
     ;


term : ID
        {printf("found an ID\n");}
     | NUM
        {printf("found a NUM\n");}
     ;

