 int count=0;
 
%%
[0-9]+   count++;REJECT;
for      printf("FOR ");
if       printf("IF ");
else     printf("ELSE ");
in       printf("IN ");
to       printf("TO ");
[+]{1}   printf("ADD ");
[-]{1}   printf("SCADERE ");
[\*]{1}  printf("INMULTIRE ");
[/]{1}   printf("IMPARTIRE ");
[a-zA-Z]+[0-9]*[\(].*[\)]       {
    int ascii='a'-'A';
    int ok=1;
    char func[255]={0};
    for(int i=0;i<strlen(yytext);i++){
        if(yytext[i]=='('){
            ok=0;
        }
        if(ok==1)
          func[i]=yytext[i]-ascii;
          else{func[i]=yytext[i];}
    }
    printf("%s ",func);
    }
[a-zA-Z]+[0-9]*     printf("VAR ");
[0-9]+              printf("INT ");
[0-9]+\.{1}[0-9]+       printf("REAL ");         
%%
yywrap(){
    printf("%d ",count);
}
