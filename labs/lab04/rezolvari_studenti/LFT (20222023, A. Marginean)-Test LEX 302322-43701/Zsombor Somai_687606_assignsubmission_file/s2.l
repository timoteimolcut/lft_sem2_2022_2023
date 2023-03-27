    #include<string.h>

    int numOfInts = 0;
    void conv(char* str, int len){
        
        for(int i = 0; i < len; i++){
            if(str[i] >= 'a' && str[i] <= 'z')
                printf("%c", str[i] - 32);
            else printf("%c", str[i]);
        }
    }
%%
[0-9]*\.[0-9]+  printf("REAL ");
[0-9]+  {numOfInts++; printf("INT ");}
\+\+ printf("INC ");
\+  printf("ADD ");
\-  printf("SUB ");
\/  printf("DIV ");
\*   printf("MUL ");
[a-zA-Z]+\(|for|in|to|if|else {char s[yyleng]; strcpy(s, yytext); conv(s, yyleng);}
[a-zA-Z]+   printf("VAR");

%%
yywrap(){
    printf("\n%d ints are in the input file\n", numOfInts);
}
