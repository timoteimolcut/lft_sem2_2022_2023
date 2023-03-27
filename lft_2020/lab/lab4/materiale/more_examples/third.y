%token INTEGER

%%
program :  program linie
           {printf("%d\n", $2);}
          | /* nothing */
           ;
linie :  'n' ':' INTEGER
          {$$ = $3+10;}
         ;