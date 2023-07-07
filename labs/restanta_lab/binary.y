%{
    #include <stdio.h>
    int number[10] = {0};
    int pos = 0;
%}
%token AND OR NOT BINARY_CODE
%%

program : program line
        | /*empty*/
        ;
line:   '\"' binary_number '\"' AND '\"' binary_number '\"'
        {
            printf("this is it: %d ", pos);
            for(int i = 0; i < 10; i++){
                printf("%d", number[i]);
            }
            pos = 0;
            for(int i = 0; i < 10; i++){
                number[i] = 0;
            }
        }
    ;

binary_number : binary_number BINARY_CODE 
                {number[pos++] = yylval;}
              | /*empty*/
                // {printf("pos: %d", pos);}
              ;


%%

int main(){
    return yyparse();
}