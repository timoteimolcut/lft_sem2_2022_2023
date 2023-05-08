%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct _node{
    char* value;
    struct _node *first;
    struct _node *second;
}node;
void prettyPrint(node* n, int k);
node* createNode(char* val);
node* createNode2(char* val, node* n1, node* node2);
%}


%union{
int val;
char id;
struct node* nd;
}
%token<val> VAL DO WHILE
%token<id> ID
%type<nd> program  bucla statement condition expression

%%

program : program bucla '\n' {
    
    prettyPrint($2,0);
}
        | ;
bucla : DO '\n' statement WHILE condition ':' '\n'{
node* node1= (node*)malloc(sizeof(node));
 node1=createNode2("do", $3,$5);
 $$=node1;
} |
;

statement : statement expression {$$=$2;}|
            statement bucla {$$=$2;}|
            expression '\n' {$$=$1;}|
            bucla  '\n' {$$=$1;}|
;
condition : ID '<' VAL {
    node* node1= (node*)malloc(sizeof(node));
    char* s1=(char*)malloc(sizeof(char));
    char* s2=(char*)malloc(sizeof(char));
    char* s3=(char*)malloc(sizeof(char));
    sprintf(s1,"%c",$1);
    sprintf(s2,"%c",'<');
    sprintf(s3,"%d", $3);
     node1=createNode2(s2,createNode(s1), createNode(s3));
     $$=node1;

} 
       |  ID '>' VAL {
    node* node1= (node*)malloc(sizeof(node));
    char* s1=(char*)malloc(sizeof(char));
    char* s2=(char*)malloc(sizeof(char));
    char* s3=(char*)malloc(sizeof(char));
    sprintf(s1,"%c",$1);
    sprintf(s2,"%c",'>');
    sprintf(s3,"%d", $3);
     node1=createNode2(s2,createNode(s1), createNode(s3));
     $$=node1;

}    ;
expression : ID '=' VAL {
    node* node1= (node*)malloc(sizeof(node));
    char* s1=(char*)malloc(sizeof(char));
    char* s2=(char*)malloc(sizeof(char));
    char* s3=(char*)malloc(sizeof(char));
    sprintf(s1,"%c",$1);
    sprintf(s2,"%c",'=');
    sprintf(s3,"%d", $3);
    node1=createNode2(s2,createNode(s1), createNode(s3));
    $$=node1;
}

%%
void main(){
    yyparse();
}

node* createNode(char* s){
    node* node1=(node*)malloc(sizeof(node));
    node1->value=s;
    node1->first=NULL;
    node1->second=NULL;
return node1;
}
node* createNode2(char* s, node* n1, node* n2){
    node* node1=(node*)malloc(sizeof(node));
    node1->value=s;
    node1->first=n1;
    node1->second=n2;
return node1;
}
void prettyPrint(node* n, int k){
    if(n==NULL){
        return;
    }
    printf("%*s%s\n",k,"",n->value);
    prettyPrint(n->first,k+2);
    prettyPrint(n->second, k+2);
    printf("%*s\n", k, "");
}
