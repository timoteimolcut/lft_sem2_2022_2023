%{
#include<stdio.h>
#include<string.h>
%}	
	int contor = 0;
%%
[a-z][a-zA-Z]*[0-9]*[-_]*\(.*\)	{
								int ok = 0;
								for(int i=0; i<yyleng; i++)
									if(yytext[i] == '(')
										ok = 1;
								if(ok == 1)
								{
									printf("%c", yytext[0]-32);
									for(int i=1; i<yyleng; i++)
										printf("%c", yytext[i]);
									ok = 0;
								}
}
[a-z]			{	printf("VAR");	}
[0-9]+ 			{	printf("INT");	contor++;	}
[0-9]+\.[0-9]+ 	{	printf("REAL");	}
\+				printf(" ADD ");
\-				printf(" SUBTRACT ");
\*				printf(" MULTIPLY ");
\/				printf(" DIVIDE ");
for				printf("FOR");
in				printf("IN");
if				printf("IF");
else			printf("ELSE");
[ \n]			ECHO;
.				ECHO;

%%
yywrap(){
  printf("\nCONTOR= %i", contor);
  return 1;
}
