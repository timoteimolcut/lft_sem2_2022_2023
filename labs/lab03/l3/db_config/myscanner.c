#include <stdio.h>
#include "myscanner.h"

extern int yylex();

int main(void){
    int ntoken;

    ntoken = yylex();
    while(ntoken){
        // printf("the token is # %d\n", ntoken);
        switch(ntoken){
            case 1:
                printf(" TYPE is ");
                break;
            case 2:
                printf(" NAME is ");
                break;
            case 3:
                printf(" TABLE_PREFIX is ");
                break;
            case 4:
                printf(" PORT is ");
                break;
            default:
                break;
        }
        ntoken = yylex();
    }
    return 0;
   
}