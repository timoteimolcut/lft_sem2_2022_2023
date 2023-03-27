D [0-9]*

%%
[ \t\n]		;
^abc$?		printf("start\n");
abc$		printf("end\n");
ac/" bc"		printf("here\n");
a{1,5}		printf("found a\n");

{D}			printf("number\n");
