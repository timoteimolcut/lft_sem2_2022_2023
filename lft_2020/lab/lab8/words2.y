%{
#include <stdio.h>
#include <string.h>
%}

%token ARTICLE VERB NOUN ADJECTIVE ADVERB PREPOSITION END

%%
text    : sentence
        | text sentence
        ;
sentence:	nphrase VERB termpunct		{ printf ("Simple noun-verb sentence.\n");
						}
	|	nphrase VERB vmodifier termpunct	{ printf ("Sentence with modified verb\n");
						}
	|	nphrase VERB nphrase termpunct	{ printf ("Sentence with object\n");
						}
	|	END				{ printf ("Got EOF from lex.\n");}
	;
termpunct:	'.'				;
	|	'!'				;
	;
nphrase:	modifiednoun			;
	|	ARTICLE modifiednoun		{ printf ("\tGot an article\n"); }
	;
modifiednoun:	NOUN
	|	nmodifier modifiednoun		{ printf ("\tmodified noun\n"); }
	;
nmodifier:	ADJECTIVE			;
	|	ADVERB nmodifier		{ printf ("\tadded an adverb to a noun modifier\n"); }
	;
vmodifier:	ADVERB				;
	|	ADVERB vmodifier		{ printf ("\tadded an adverb to a verb modifier\n"); }
	|	PREPOSITION nphrase		{ printf ("\tprepositional phrase\n"); }
	;

%%

