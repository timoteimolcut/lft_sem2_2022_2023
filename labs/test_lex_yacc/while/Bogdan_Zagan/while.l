%{
    #include "while.tab.h"
%}

%%
"while" {return WHILE;}
"if" {return IF;}
"else" {return ELSE;}
":" {return COLON;}
"=" {return ASSIGN;}
"<" {  yyval.comp_op=LT; return COMP_OP; }
">" {  yyval.comp_op=GT; return COMP_OP; }
"<=" {  yyval.comp_op=LTE; return COMP_OP; }
">=" {  yyval.comp_op=GTE; return COMP_OP; }
"==" { yylval.comp_op =EQ; return COMP_OP; }
"!=" { yylval.comp_op = NEQ; return COMP_OP; }
"("  { return LPAREN; }
")"  { return RPAREN; }
"+"  { return PLUS; }
"-"  { return MINUS; }
"*"  { return TIMES; }
"/"  { return DIV; }
"%"  { return MOD; }

[ \t\n]    ; // ignore whitespace

[a-zA-Z]   { yylval.variable = yytext[0]; return ID; }
[0-9]+     { yylval.constant = atoi(yytext); return CONSTANT; }

.         { printf("Invalid character: %c\n", yytext[0]); }

%%

int yywrap() {
    return 1;
}