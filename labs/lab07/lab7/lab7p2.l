%{
    #include "y.tab.h"
%}


%%


"if"                  return IF;
"then"                return THEN;
"else"                return ELSE;
[a-zA-Z]+             return ID;
[0-9]+                return NUM;

[\(\)<]               return *yytext;
