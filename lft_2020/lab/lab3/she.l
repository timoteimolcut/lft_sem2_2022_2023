D   he
    int s, h;
%%
s{D}      s++;REJECT;
{D}       h++;
\n        ;
.         ;

%%
int yywrap(){
  printf("She: %i; he:%i\n", s, h);
  return 1;
}

