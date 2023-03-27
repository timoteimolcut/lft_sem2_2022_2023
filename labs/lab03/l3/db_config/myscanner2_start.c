#include <stdio.h>
#include "myscanner.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

char *names[]={NULL, "db_type", "db_name", "db_table_prefix", "db_port"};

int main(void){
    int ntoken, vtoken;

    ntoken = yylex();
    while(ntoken){
        printf("%d\n", ntoken);
        if (yylex()  != COLON){
	        printf("Syntax error in line %d, expected a ':', but found %s\n", yylineno, yytext);
            return 1;
        }
        vtoken = yylex();
	switch(ntoken){
        case TYPE: 
            // printf("");
            break;
        case NAME:
            // printf("");
            break;
        case TABLE_PREFIX:
            // printf("");
            break;
        case PORT:
            printf(" is set to ");
            break;
        default:        
           printf("Syntax error in line %d\n", yylineno);
        }
       
        
    }
    return 0;
   
}
