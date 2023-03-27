%START A B C


%%

^a 			{BEGIN A;}
^b 			{BEGIN B;}
^c 			{BEGIN C;}
\n			{BEGIN 0;}

<A>magic		printf("1");
<B>magic		printf("2");
<C>magic		printf("3");
%%
