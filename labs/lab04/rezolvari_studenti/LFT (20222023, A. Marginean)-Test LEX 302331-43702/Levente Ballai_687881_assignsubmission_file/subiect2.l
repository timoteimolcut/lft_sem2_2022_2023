	int count = 0;

%%

[0-9]+              { printf("INT"); count++; }
[0-9]+\.[0-9]+      printf("REAL"); 
"if"    	    printf("IF");
"else"  	    printf("ELSE");
"for"   	    printf("FOR");
"in"		    printf("IN");
[abix]		    printf("VAR");
[A-Za-z]+=	    printf("VAR=");	
"+"		    printf("ADD");
"-"		    printf("SUB");
"*"		    printf("MUL");
"/"	  	    printf("DIV");
"++"		    printf("INC");
"print"		    printf("Print");
"exit"		    printf("Exit");


%%

int yywrap(void)
{
    printf("Numarul numerelor intregi: %i\n", count);
    return 1;
}
