%token INTEGER

%right '+' '-'
%right '*' '/'
  


%%

program  : program expression '\n'
	          { printf("%d\n", $2); }
         |      /* NULL */
	       ;

expression : INTEGER
           | expression '+' expression
	           { $$ = $1 + $3; }
           | expression '-' expression
	           { $$ = $1 - $3; }
           | expression '*' expression
            { $$ = $1 * $3; }
           | expression '/' expression
            { $$ = $1 / $3; }
           ;
