    #include "y.tab.h"

%%

    // do          return DO;
    // while       return WHILE;
    // [a-z]       {
    //                 yylval.variable = yytext[0];
    //                 return ID;
    //             }
    // -?[0-9]+    {
    //                 yylval.value = atoi(yytext);
    //                 return NUMBER;
    //             }
    // [<=>:]      return yytext[0];
[\t\n ]        ;

