    int i = 0;
    int r = 0;
    void printUpper(char s[], int len);
%%

for                                            printf("FOR");
if                                            printf("IF");
else                                            printf("ELSE");
in                                            printf("IN");
to                                            printf("TO");
[a-zA-Z_]+"("                                printUpper(yytext, yyleng);
[a-zA-Z_]+                                     printf("VAR");
[0-9]+"."[0-9]*([DEde][-+]?[0-9]+)?                         {printf("REAL"); r++;};
[0-9]+                                                      {printf("INT"); i++;};
"+"                                             printf(" ADD ");
"-"                                             printf(" SUB ");
"/"                                             printf(" DIV ");
"*"                                             printf(" MUL ");


%%

void printUpper(char s[], int len){
    for(int i =0;i<len-1;i++){
        printf("%c",s[i] + 'A' - 'a');
    }
    printf("(");
}

yywrap(){
  printf("\nintegers: %d\n floats:%d\n",i,r);
  return 1;
}