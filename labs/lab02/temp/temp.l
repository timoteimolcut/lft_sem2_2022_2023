D 	[0-9]
E	[DEde][-+]?{D}+
%%
[+-]?{D}+			printf("integer");

[+-]?{D}+\.{D}*({E})? 	printf("real");


