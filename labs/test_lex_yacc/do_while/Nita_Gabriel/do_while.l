%{
    #include "do_while.tab.h"
%}
%%

"do"    { return DO; }
"while" { return WHILE; }
[a-zA-z] { yylval.var=yytext[0]
            return ID;
         }
[0-9]+   {
                    yylval.num = atoi(yytext);
                    return NUMBER;
         }

[\n=><()+\-*/%]     {return *yytext};

.        {
                fprintf(stderr, "Unexpected character: %s\n", yytext);
                exit(1);
         }


%%

int yywrap() {
    return 1;
}