%%


=-[a-zA-Z]+  {
                printf("Op (=-) ambiguous, yyleng: %d\n", yyleng);
                yyless(yyleng-2);
                /* action for =-*/
            }
