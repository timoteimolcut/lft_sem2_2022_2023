%%

while       { return WHILE; }
[a-zA-Z]    { yylval.variable = yytext[0]; return VARIABLE; }
[0-9]+      { yylval.value = atoi(yytext); return INTEGER; }
[><=!]+     { return OP; }
[\n\s]+     { }

%%