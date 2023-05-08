/* */
%{
    #include "y.tab.h"
%}
digit [0-9]
letter [a-zA-Z]
%%
while       {return WHILE;}
{digit}+    {   yylval.val=atoi(yytext);  
                return VALUE;}
{letter}+   {   yylval.id=yytext[0]; 
                return ID;}
[\=]        {return ASSIGN;}
\<          {return LT;}
\>          {return GT;}
[\n]        {return NL;}
[\t\:]      ;
%%

