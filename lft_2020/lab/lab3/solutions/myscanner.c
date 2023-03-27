#include <stdio.h>
#include "myscanner.h"

extern int yylex();
//here   
int main(void){
    int ntoken;
    //here too //			
    ntoken = yylex();
    while(ntoken){
        printf("%d\n", ntoken);
        ntoken = yylex();
    }
    //		

    //hey
    //
    return 0;

}