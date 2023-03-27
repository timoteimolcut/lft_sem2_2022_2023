
	int nr_chars = 0;

%%

.		nr_chars++;
\n 		;

%%

int yywrap(){
	printf("#chars: %d\n", nr_chars);
	return 1;
}