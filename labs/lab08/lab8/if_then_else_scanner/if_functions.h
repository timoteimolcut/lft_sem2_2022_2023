typedef struct _node{
  int type;
  struct _node *first;
  struct _node *second;
  struct _node *third;
  int value;
} node;


node *opr2(int type, node *first, node *second);

node *opr3(int type, node *first, node *second, node * third);

node *setConst(int value);