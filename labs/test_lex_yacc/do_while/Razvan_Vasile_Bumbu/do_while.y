%{
#include <stdio.h>     
#include <stdlib.h> 

int yylex();
void yyerror();


extern char* yytext;


typedef struct node {
    char *value;
    struct node *first;
    struct node *second;
    struct node *third;
} node;


node* insertNode(char* value, node* first, node* second, node* third);


void prettyPrint(node *nd, int indent);
%}

%union  {
            char* value;
            char id;
            char* str;
            struct node *next;
        }

%token<value> VALUE DO WHILE;
%token<id> ID;
%type<next> program statement do_statement while_cond condition expression;


%%
program :   program do_statement '\n'
                {
                    printf("Found do\n");
                    prettyPrint($2, 0);
                }
                | program while_cond '\n'
                {
                    printf("Found while\n");
                    prettyPrint($2, 0);
                }
                | program condition '\n'
                {
                    printf("Found condition\n");
                    prettyPrint($2, 0);
                }
                |
                ;


statement :     expression
                | do_statement  
                    {
                        printf("Found do statement\n");
                    }
                ;


do_statement :  DO statement 
                    {
                        node *p = insertNode("do", $2, NULL, NULL);
                        printf("Found do ... while\n");
                        $$ = p;
                    }
                | DO statement DO statement
                    {
                        node *p = insertNode("do", $2, "do", $4);
                        printf("Found do\n");
                        $$ = p;
                    } 
                ;

while_cond :    WHILE condition ":"
                    {
                        node *p = insertNode("while", $2, NULL, NULL);
                        printf("Found while\n");
                        $$ = p;
                    }
                ;

condition :     ID '>' VALUE 
                    {
                        char s1[100];
                        char s2[100];
                        char s3[100];
                        sprintf(s1, "%c", $1);
                        sprintf(s2, "%s", ">");
                        sprintf(s3, "%s", $3);
                        node *p = insertNode(s2, insertNode(s1, NULL, NULL, NULL), insertNode(s3, NULL, NULL, NULL), NULL);
                        printf("Found expression %s = %s\n", s1, s3);
                        $$ = p;
                    }
                | ID '<' VALUE 
                    {
                        char s1[100];
                        char s2[100];
                        char s3[100];
                        sprintf(s1, "%c", $1);
                        sprintf(s2, "%s", "<");
                        sprintf(s3, "%s", $3);
                        node *p = insertNode(s2, insertNode(s1, NULL, NULL, NULL), insertNode(s3, NULL, NULL, NULL), NULL);
                        printf("Found expression %s = %s\n", s1, s3);
                        $$ = p;
                    }
                ;


expression :    ID '=' VALUE 
                    {
                        char s1[100];
                        char s2[100];
                        char s3[100];
                        sprintf(s1, "%c", $1);
                        sprintf(s2, "%s", "=");
                        sprintf(s3, "%s", $3);
                        node *p = insertNode(s2, insertNode(s1, NULL, NULL, NULL), insertNode(s3, NULL, NULL, NULL), NULL);
                        printf("Found expression %s = %s\n", s1, s3);
                        $$ = p;
                    }
                ;


%%
void yyerror(char *s){
    printf("Error: %s\n", yytext);
}



node* insertNode(char* value, node* first, node* second, node* third){
   node *p = (node*)malloc(sizeof(node));
   p->value = value;
   p->first = first;
   p->second = second;
   p->third = third;
}



void prettyPrint(node *nd, int indent){
    if (nd == NULL)
        return;
    printf("%*s %s \n", indent, "", nd->value);
    prettyPrint(nd->first, indent + 1);
    prettyPrint(nd->second, indent + 1);
    prettyPrint(nd->third, indent + 1);
    printf("%*s \n", indent, "");
}