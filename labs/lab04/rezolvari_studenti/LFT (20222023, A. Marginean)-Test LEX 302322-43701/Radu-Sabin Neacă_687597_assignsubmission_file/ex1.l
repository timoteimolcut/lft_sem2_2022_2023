%{
    int count = 0;
%}
%%
print             { printf("PRINT"); }
exit              { printf("EXIT"); }
[+]{2}            { printf("INCREMENT"); }
for               { printf("FOR"); }
\+                { printf("ADD"); }
\*                { printf("MULTIPLY"); }
\-                { printf("SUB"); }
in                { printf("IN"); }
if                { printf("IF"); }
else              { printf("ELSE"); }
[a-zA-Z]+         { printf("VAR"); }
[0-9]+[.]+[0-9]+  { printf("REAL");}
[0-9]+            { 
    printf("INT");
    count++;
}
%%
int main(){
    yylex();
    printf("\nIn cod sunt %d numere intregi\n", count);
}



