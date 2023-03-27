#include <stdio.h>
#include <stdlib.h>
typedef struct _node {
     int type;
     struct _node *first;
     struct _node *second;
    
    } node;

node *opr(int type, node *first, node *second){
   node *p;
   p=(node*)malloc(sizeof(node));
   p->type= type;
   p->first=first;
   p->second = second;
}




void printpre(node *opr){
   if (opr==NULL)
       return ;
   printf(" ( %d ", opr->type);
   printpre(opr->first);
   printpre(opr->second);
   printf(" ) ");
   
}

int main(){
  node *f = opr(1, NULL, NULL);
  node *f2 = opr(3, NULL, NULL);
  node *f3 = opr(2, f2, f); 
  printpre(f3);
  return 1;
}
