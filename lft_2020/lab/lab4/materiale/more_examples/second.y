%token INTEGER

%%
program :  program linie
           {printf("%d\n", $2);}
          | /* nothing */
           ;
linie : INTEGER
          {$$ = $1+10;}
         ;