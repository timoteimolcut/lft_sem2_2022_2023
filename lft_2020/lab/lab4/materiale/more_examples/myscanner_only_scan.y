%token IDENTIFIER
%token COLON
%token TYPE
%token NAME
%token TABLE_PREFIX
%token PORT
%token INTEGER
%start configuration
%%

configuration : configuration conf '\n'
              | /*NULL*/
              ;
conf : PORT COLON INTEGER
    		{printf("\n descriere port \n");} 
     | NAME COLON IDENTIFIER
            {printf("\n descrierea numelui bazei de date \n");} 
     | TYPE COLON IDENTIFIER
     		{printf("\n descrierea tipului bazei de date \n");}
     | TABLE_PREFIX COLON IDENTIFIER
     		{printf("\n descrierea prefixului bazei de date \n");}
     ;
