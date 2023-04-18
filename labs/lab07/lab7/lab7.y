%{
    #include <stdio.h>
    int yylex ();
    void yyerror ( const char * s );
    
%}
%token NUMBER IF ID

%left '+'

%%

exp : NUMBER
        {
            printf("value: %d %d\n", $1, yylval);
            $$ = yylval;
        }
    ;


