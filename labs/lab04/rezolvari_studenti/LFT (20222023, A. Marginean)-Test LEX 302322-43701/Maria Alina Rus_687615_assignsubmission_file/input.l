%%
int contor = 0;
int number = 0,number1, number2;

[-]{0,1}[0-9]\b {
    contor++; 
    printf("INT\n");
}
\n {
    printf("%d",contor);
}

^[0-9]+ | [+]+ {
    contor++;
    number = number1 + number2;
    printf("%d", number);
    printf("ADD\n");
}

\n {
    printf("%d",contor);
}

^[0-9]+ | [-]+ {
    contor++;
    number = number1 - number2;
    printf("%d", number);
    printf("SUB\n");
}

\n {
    printf("%d",contor);
}

^[0-9]+ | [/]+ {
    contor++;
    number = number1 / number2;
    printf("%d", number);
    printf("DIV\n");
}

\n {
    printf("%d",contor);
}

^[0-9]+ | [*]+{
    contor++;
    number = number1 * number2;
    printf("%d", number);
    printf("MUL\n");
}

\n {
    printf("%d",contor);
}

%%

