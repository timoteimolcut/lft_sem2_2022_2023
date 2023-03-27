%{
int _INT_CNT = 0;
%}

%%
for                                         printf("FOR");
in                                          printf("IN");
to                                          printf("TO");
if					    printf("IF");
else                                        printf("ELSE");
[a-zA-Z_][a-zA-Z0-9_]*                      printf("VAR");
[0-9]+                                      {printf("INT");_INT_CNT++;}
[0-9]+"."[0-9]*(eE[-+]?[0-9]+)?             printf("REAL");
"+"                                         printf(" ADD ");
"-"                                         printf(" SUB ");
"*"                                         printf(" MUL ");
"/"                                         printf(" DIV ");
"%"                                         printf(" MOD ");
"<"                                         printf(" SMALLER ");
">"                                         printf(" GREATER ");
"=="                                        printf(" EQUALS ");
[a-zA-Z_][a-zA-Z0-9_]*\(		    {if('a' <= yytext[0] <= 'z'){yytext[0]-='a' - 'A';} printf(yytext);}
%%

int main(void){
  yylex();
  printf("In total there are %d ints", _INT_CNT);
  return 0;
}