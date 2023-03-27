%{
/* C code */
    #include <stdio.h>
    
    int numere = 0;

%}
    char flag;
%%

[a-zA-Z]        { printf(" VAR "); }

\([a-zA-Z]\)    { printf(" (VAR) "); }

([+-]?[0-9]+\.[0-9]+)   { printf(" REAL "), numere--; }

([0-9]+)        { printf(" INT "), numere++; }

[\+]{2}          { printf(" INCREMENT "); }

[\+]               { printf(" ADD "); }

[\-]               { printf(" SUB "); }

[\*]              { printf(" MUL "); }

[\/]              { printf(" DIV "); }

[a-z]*[in][a-z]*             { if (yyleng == 2) printf(" IN "); }

if              { printf(" IF "); }

else            { printf(" ELSE "); }

for             { printf(" FOR "); }

([a-zA-Z]+)\(.*\)     { for(int i = 0 ; i < yyleng ; ++i) { 
                            if (yytext[i] >= 'a' && yytext[i] <= 'z') 
                                printf("%c", yytext[i] - 32);
                            else  
                                printf("%c", yytext[i]); 
                        }   
                    }

%%

yyerror(s)
char *s;
{
  fprintf(stderr, "%s\n",s);
}

yywrap (){
    printf("\n In file sunt \%i numer intregi \n", numere);
    return(1);
}
