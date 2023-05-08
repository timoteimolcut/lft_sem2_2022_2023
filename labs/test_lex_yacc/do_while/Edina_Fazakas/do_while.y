%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yylex();
void yyerror(const char *);

typedef struct node {
    int type;
    char *var;
    int intv;
    struct node *left;
    struct node *right;
} node;

node* create_node(int type, char *var, int intv, node *left, node *right);
void tree_print(node *root);
void free(node *root);

node *root = NULL;
%}

%union{
    char *var;
    int intv;
    node *tree_node;
}

%token DO WHILE VAR INT GREATER LESS EQUALS COLON SEMICOLON
%type <tree_node> statement condition block dowhilestatement
%%

program :
    | program dowhilestatement {root = create_node(0, NULL, 0, $1, $2); }
    ;

dowhilestatement :
    DO block WHILE condition COLON SEMICOLON { $$ = create_node(DO, NULL, 0, $2, $4); }
;

block :
    | block statement { $$ = create_node(0, NULL, 0, $1, $2); }
;

statement :
    VAR EQUALS INT SEMICOLON { $$ = create_node(EQUALS, $1, $3, NULL, NULL); }
    | dowhilestatement { $$ = $1; }
;

condition :
    VAR GREATER INT { $$ = create_node(GREATER $1, $3, NULL, NULL); }
    | VAR LESS INT { $$ = create_node(LESS, $1, $3, NULL, NULL); }
    | VAR EQUALS INT { $$ = create_node(EQUALS, $1, $3, NULL, NULL); }
;

%%
node *create_node(int type, char *var, int intv, node *left, node *right){
    node *new_node = (node*)malloc(sizeof(node));
    new_node->type = type;
    new_node->var = var;
    new_node->intv = intv;
    new_node->left = left;
    new_node->right = right;
    return new_node;
}

void tree_print(node *root){
    if (root != NULL){
        tree_print(root->left);
        switch (root->type){
            case DO:
                printf("do\n");
                tree_print(root->left);
                printf("while ");
                tree_print(root->right);
                printf(":\n");
                break;
            case EQUALS:
                printf("%s = %d;\n", root->var root->intv);
                break;
            case GREATER:
                printf("%s > %d", root->var, root->intv);
                break;
            case LESS:
                printf("%s < %d", root->var root->intv);
                break;
            default:
                break;
        }
        tree_print(root->right);
    }
}

void free(node *root){
    if (root != NULL){
        free(root->left);
        free(root->right);
        if (root->var != NULL){
            free(root->var);
        }
        free(root);
    }
}

int main(){
    yyparse();
    tree_print(root);
    free(root);
    return 0;
}