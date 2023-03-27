%%
^[-]?[0-9]+ {INT++;
            printf("integer=%s\n",yytext);
            }
[0-9]+"."[0-9]+ { REAL++;
                printf("float=%s\n",yytext);
                }

%%

