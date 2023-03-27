    int nr;
    
%%
for                             printf("FOR");
in                              printf("IN");
to                              printf("TO");
if                              printf("IF");
else                            printf("ELSE");
print                           printf("PRINT");
exit                            printf("EXIT");
[0-9]+"."[0-9]+                 printf("REAL");
[0-9]+                          {printf("INT"); nr++;}
[\ba-z\b]                       printf("VAR");
[\+]                            printf("ADD");
[\-]                            printf("SUB");
[\*]                            printf("MUL");
[\/]                            printf("DIV");
.                               ECHO;

%%
yywrap(){  
    printf("%d/n", nr);
	return 1;   
}
