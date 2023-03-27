
%{
int s = 0, h = 0;
%}

%%

she 		{
				s++;
				REJECT;
			}
he			h++;
\n			|
.			;

%%
int main() {
	yylex();
 	if(yywrap() == 1){
	 	printf("s: %d\n", s);
		printf("h: %d\n", h); 	
 	}
}
