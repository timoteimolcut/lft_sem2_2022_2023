%{

int var = 0;

%}

%%


"+"                 printf("ADD");
"-"                 printf("SUB");
"*"                 printf("MUL");
"/"                 printf("DIV");

for                 printf("FOR ");
in                  printf("IN ");
to                  printf("TO ");

if                  printf("IF ");
else                printf("ELSE ");

print               printf("PRINT");
exit                printf("EXIT");

[a-z]+              printf("VAR");


[0-9]+"."[0-9]*     printf(" REAL ");
                    
[0-9]+              {
                        printf(" INT ");
                        var++;
                    }

%%

int yywrap(){

    printf("\n\ntotal # of ints: %d\n", var);
    return 1;
}