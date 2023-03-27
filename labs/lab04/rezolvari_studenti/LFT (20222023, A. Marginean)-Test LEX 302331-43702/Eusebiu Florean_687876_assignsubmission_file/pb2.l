   int counter;
%{
    //variabile incep cu litera mica si pot contine si alte caractere
%}
%%
for|if|in|else   {  int dif = 'a'-'A';
                    for(int i = 0; i < yyleng; i++)
                       printf("%c", yytext[i] - dif);
                 }  
[0-9]+[\.][0-9]       printf(" REAL ");
[0-9]+                {counter++; printf(" INT ");}
\+                    printf(" ADD ");
-                     printf(" SUB ");
\*                    printf(" MUL ");
\/                    printf(" DIV ");  
[a-z][a-z]+                     ECHO;
[a-z]                 printf(" VAR ");
%%
yywrap() {
    printf("\nnumere intregi : %d\n", counter);
    return 1;
}