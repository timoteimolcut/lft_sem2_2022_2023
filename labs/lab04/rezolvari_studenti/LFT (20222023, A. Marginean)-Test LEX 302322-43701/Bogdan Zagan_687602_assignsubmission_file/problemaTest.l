	int flag = 0;
%%
for|printf|return	{if(flag == 0) printf("KEY");}
[0-9]	{if(flag == 0) printf("INT");}
[a-zA-Z]			{if(flag == 0) printf("VAR");}
([0-9]+"."[0-9]+)			{if(flag == 0) printf("REAL");}
[+]			{if(flag == 0) printf("ADD");}
[-]			{if(flag == 0) printf("DIF");}
[*]			{if(flag == 0) printf("MULTIPLE");}
[/]			{if(flag == 0) printf("DIVIDE");}

%%
