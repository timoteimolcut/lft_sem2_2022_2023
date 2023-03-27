   // be happy/healty/responsable/empathic/virus free/worry free/fear free
  //don't be sad/worried/
  // be <positive adjective>| be <negativenoun> free
  //don't be <negative adjective>

%{
#include "y.tab.h"
%}
%option yylineno

%%
be|stay                              return BE;
don't                                return DONT;
happy|healthy|responsable|empathic   return PADJ;
sad|worried                          return NADJ;
virus|worry|fear                     return NNOUN;  
free                                 return FREE;
read								 return READ;
book|"technical paper"				 return READABLE_A;
article 							 return READABLE_AN;
a 									 return A_ARTICLE;
an 									 return AN_ARTICLE;

\n                                   return *yytext;  
%%