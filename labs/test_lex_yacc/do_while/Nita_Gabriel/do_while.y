%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror();


typedef struct _node {
        char type[10];
        char variable;
        int value;
        struct node* left;
        struct node* right;
    } node;

     node* createNode(char type[10], char variable, int value, node* left, node* right) {
        node* newNode = (node*)malloc(sizeof(node));
        strcpy(newNode->type, type);
        newNode->variable = variable;
        newNode->value = value;
        newNode->left = left;
        newNode->right = right;
        return newNode;
    }
%}

%union {
    int num;
    char var;
    struct _node node;
}

%token <node> DO 
%token <node> WHILE 
%token <var> ID 
%token <num> NUMBER

%left '+' '-'
%left '*' '/'
%left '%'

%type <node> statement  input condition

%%
input:
    /* empty */
    | input statement WHILE condition ':'
    | error ';' { printf("Eroare \n"); }

statement:
    ID '=' NUMBER { $$ = createNode("=", $1, $3, NULL, NULL); }
    | DO statement WHILE condition ':' { $$ = createNode("DO WHILE", '\0', 0, $2, $4); }
    | error ';' { printf("Eroare \n"); }

condition: 
    ID '<' NUMBER { $$ = createNode("<", $1, $3, NULL, NULL); }
    | ID '>' NUMBER { $$ = createNode(">", $1, $3, NULL, NULL); }
    | error ':' { printf("Eroare \n");  }

%%


void main(){
    printf("\nScanner has started\n\n");
    yyparse();
}