
%%
for                                printf("FOR");
in                                 printf("IN");
if                                 printf("IF");
else                               printf("ELSE");
"+"                                printf("ADD");
"-"                                printf("SUBB");
"*"                                printf("MULL");
"%"                                printf("MOD");
"/"                                printf("DIV");
[a-zA-Z]([-_A-Za-z0-9])*           printf("VAR");
[0-9]+                             printf("INT");
-?([1-9][0-9]*)|0("."[0-9]+)?      printf("REAL");
[\n]                               printf("\n");

