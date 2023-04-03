FOR for
ELSE else
IN in 
TO to
PRINT print
IF if
EXIT exit
%%

[0-9]+ {printf("INT ");}
[0-9]+\.[0-9]+ {printf("REAL ");}
\+ {printf("ADD ");}
\- {printf("SUBSTRACT ");}
\/ {printf("DIVIDE ");}
\< {printf("LESS THAN ");}
{FOR} {printf("FOR" );}
{ELSE} {printf("ELSE ");}
{IN} {printf("IN ");}
{TO} {printf("TO ");}
{PRINT} {printf("PRINT ");}
{IF} {printf("IF ");}
{EXIT} {printf("EXIT \n");}
[a-zA-Z][a-zA-Z0-9_]* {printf("VAR ");}
