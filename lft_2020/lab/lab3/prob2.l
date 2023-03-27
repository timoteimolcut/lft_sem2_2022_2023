	
	int comm_lines = 0, code_lines = 0;
	//liniile goale se numara drept linii de cod

D [ \t\40-\56\60-\176]

%%

^[ \t]*"//"{D}*["/"]*			{
									comm_lines++;
									printf("comment: '%s'\n", yytext);
								}


^([ \t]*{D}*(";")?)|(\n)		{
									code_lines++;
									printf("code: '%s'\n", yytext);
								}


.								|
\n 								;

%%
int yywrap(){

	printf("comments: %d\ncode lines: %d\n", comm_lines, code_lines);
	return 1;
}