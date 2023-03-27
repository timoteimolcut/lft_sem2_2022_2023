D   he


%{
int s, h;    
%}

%%

s{D}      {s++; }
{D}       {h++; REJECT;}
\n        ;
.         ;

%%
yywrap(){
    printf("She: %d; he: %d\n", s, h);
    return 1;
}

