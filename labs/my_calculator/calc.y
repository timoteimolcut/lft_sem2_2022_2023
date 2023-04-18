
%token VAR   INT_NR   FLOAT_NR 

%%

program : program line
        | /*empty*/
        ;

line = 

expr : expr '+' expr
     | expr '-' expr
     | expr '*' expr
     | expr '/' expr
     ;
