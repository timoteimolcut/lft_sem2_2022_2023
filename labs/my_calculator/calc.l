

%%

[=-*/\n]                return *yytext;


[0-9]+"."[0-9]*         return FLOAT_NR;

[0-9]+                  return NR;

[a-zA-Z_0-9]+           return VAR; 


