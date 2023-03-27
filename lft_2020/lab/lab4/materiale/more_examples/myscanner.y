%token <svalue> IDENTIFIER
%token COLON
%token TYPE
%token NAME
%token TABLE_PREFIX
%token PORT
%token <ivalue> INTEGER
%start configuration 
%{

void yyerror(char *s);
%}

%union { int ivalue;
         char* svalue;
     }
%%

configuration : configuration conf '\n'
              | /*NULL*/
              ;
conf : PORT COLON INTEGER
            {printf("port: %i\n", $3);} 
          
       | TYPE COLON IDENTIFIER
            {printf("Type: %s\n", $3);} 
          ;
%%
