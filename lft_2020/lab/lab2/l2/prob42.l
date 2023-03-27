%{

int number;

%}

S [+-]
D [0-9]

%%

{S}?{D}+   	{
				number = atoi(yytext);
				if(7 <= number && number <= 12){
					number += 7;
				} else if(number < -100){
					number *= 10;	
				}
				printf("%d\n", number);
			}

.	|
\n 	;

