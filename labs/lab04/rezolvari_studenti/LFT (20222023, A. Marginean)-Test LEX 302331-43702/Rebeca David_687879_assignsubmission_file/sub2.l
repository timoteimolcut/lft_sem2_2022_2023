	int cont=0;
%
[a-zA-Z]+       { printf("VAR"); }
[+-]?[0-9]+	    { printf("INT"); cont++;}
[+-]?[0-9]+"."[0-9]*    { printf("REAL"); }
[+]     { printf("ADD"); }
[-]     { printf("SUB"); }
[*]     { printf("MUL"); }
[/]     { printf("DIV"); }
for     { printf("FOR"); }
if      { printf("IF"); }
else    { printf("ELSE"); }
in      { printf("IN"); }
[a-zA-Z]+"("[a-zA-Z]*[0-9]*")"      { for(int i=0 ;i<yylen; i++)
	                                    yytext[i]=yytext[i]-('a'-'A');
                                     printf(yytext);}
%
yywrap()
{  
	printf("Nr. de intregi: %d", cont);
	return(1);
}


