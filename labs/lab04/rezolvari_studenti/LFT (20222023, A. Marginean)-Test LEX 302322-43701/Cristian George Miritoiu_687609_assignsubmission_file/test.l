    int count;
%%
"+"                 printf(" ADD ");
"-"                 printf(" MINUS ");
"*"                 printf(" OR ");
"/"                 printf(" DIV ");
for                 printf(" FOR ");
in                  printf(" IN ");
if                  printf(" IF ");
else                printf(" ELSE ");
print               printf(" PRINT ");
exit                printf(" EXIT ");
to                  printf(" TO ") ;
[A-Za-z_]+[0-9_]*   printf(" VAR ");
[0-9]+              {printf(" INT ");count+=1;}
[0-9]+"."[0-9]+     printf(" REAL ");
\n                  printf("\n");
%%
int yywrap(void)
{
    printf("\n Numere integi %d",count);
	return 1;
}


