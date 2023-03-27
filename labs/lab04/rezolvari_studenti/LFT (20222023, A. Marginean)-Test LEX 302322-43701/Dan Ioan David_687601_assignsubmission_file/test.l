WORD        [a-zA-Z_]+
INTIGER     [1-9][0-9]*
REAL        [0-9]+\.[0-9]+
FUNCTION    [a-zA-Z_]+\([a-zA-Z_]*\)
            int upgrade='A'-'a';
            int intCounter=0;
%%
for         printf("FOR");
in          printf("IN");
to          printf("to");
if          printf("IF");
else        printf("ELSE");
\+          printf("ADD");
-           printf("MINUS");
\/          printf("DIVIDE");
\*          printf("TIMES");
{WORD}      printf("VAR");
{INTIGER}   printf("INT"); intCounter++;
{REAL}      printf("REAL");
{FUNCTION}  printf("%c%s", yytext[0]+upgrade, yytext+1);

%%
int yywrap(){
    printf("\n\n%d variabile intregi\n", intCounter);
    return 1;
}