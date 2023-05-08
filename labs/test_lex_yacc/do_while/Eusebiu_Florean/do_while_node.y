%{
   #include <stdio.h>
   #include <string.h>

   typedef struct _node{
    char* value;
    struct _node *first;
    struct _node *second;
    struct _node *third;
   }node;

  node* getNode(char* value);
   node* getNode1(char* value, node* node1);
  node* getNode2(char* value, node* node1, node* node2);
  node* getNode3(char* value, node* node1, node* node2, node* node3);
   void printpre(node* node, int indent);
%}

%union{
    int num;
    char var;
    char* str;
    struct _node *nd;
}

%token DO WHILE
%token<num> NUMBER
%token<var> VARIABLE
%type<nd> statement
%type<str> condition whilee while_statement
%%

program : program statement {printf("%s\n", $2);
                             printpre($2, 0);
                            }
        | program whilee {printf("%s\n", $2);}
        |
        | program '\n' 
        ;

whilee :        DO '\n' while_statement WHILE condition '\n' {
                                                            $$ = (char*)malloc(1000);
                                                            sprintf($$, "do %s while %s", $3, $5);
                                                         }
while_statement : statement
                | whilee {printf("found imbricated while\n");}
                | statement whilee                        {
                                                            $$ = (char*)malloc(1000);
                                                            sprintf($$, "%s do_while: (%s)",$1, $2);
                                                          }
                ;
condition       : VARIABLE '>' NUMBER ':' 
                                                        {
                                                          $$ = (char*)malloc(1000);
                                                          sprintf($$, "%c%c%d%c", $1, '>', $3, ':');
                                                          //printf("%s\n", $$);
                                                        } 
                | VARIABLE '<' NUMBER ':' 
                                                        {
                                                         $$ = (char*)malloc(1000);
                                                         sprintf($$, "%c%c%d%c", $1, '<', $3, ':');
                                                         //printf("%s\n", $$);
                                                        }
                ; 

statement      : VARIABLE '=' NUMBER '\n'               {
                                                         char *s1 = (char*)malloc(sizeof(char));
                                                         char *s2 = (char*)malloc(sizeof(char));
                                                         char *s3 = (char*)malloc(sizeof(char));
                                                         sprintf(s1, "%c", $1);
                                                         sprintf(s2, "%c", '=');
                                                         sprintf(s3, "%d", $3);
                                                         $$ = getNode2("=", getNode(s1), getNode(s3));
                                                        }


%%
   void printpre(node* node, int indent) {
    if (node == NULL) {
        return;
    }
    printf("%*s%s\n", indent, node->value);
    printpre(node->first, indent + 2);
    printpre(node->second, indent + 2);
    printpre(node->third, indent + 2);
   }

   node* getNode(char* value) {
    node *p = (node*)malloc(sizeof(node*));
    p->value = value;
    p->first = NULL;
    p->second = NULL;
    p->third = NULL;
   }

    node* getNode1(char* value, node* node1) {
    node *p = (node*)malloc(sizeof(node*));
    p->value = value;
    p->first = node1;
    p->second = NULL;
    p->third = NULL;
   }

    node* getNode2(char* value, node* node1, node* node2) {
    node *p = (node*)malloc(sizeof(node*));
    p->value = value;
    p->first = node1;
    p->second = node2;
    p->third = NULL;
   }

   node* getNode3(char* value, node* node1, node* node2, node* node3) {
    node *p = (node*)malloc(sizeof(node*));
    p->value = value;
    p->first = node1;
    p->second = node2;
    p->third = node3;
   }

