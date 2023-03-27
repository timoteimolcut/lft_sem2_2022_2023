%{
	#include <stdio.h>
	#include <stdlib.h>


%}

%token ME OTHER_SUB  I_VERB OTHER_VERB COMPLEMENT 
%token PREP NEGATION POS_MOOD NEG_MOOD OBJECT 
%token POS_EMO NEG_EMO TIME ARTICLE AND
%%



conversation:   /*nothing*/
			|   conversation line  '\n'
			;


line:   pos_msg 
		{printf("Why are you happy?\n");}
	|   neg_msg
		{printf("Why are you sad?\n");}
	|   random_msg
	;

pos_msg : me_group   POS_MOOD TIME '.'
		| me_group   NEGATION NEG_MOOD TIME '.'
		| me_group   POS_MOOD '.'
		| me_group   NEGATION NEG_MOOD '.'
		| me_group   POS_EMO 
		| random_msg AND pos_msg
		;

neg_msg : me_group   NEG_MOOD TIME '.'
		| me_group   NEGATION POS_MOOD TIME '.'
		| me_group   NEG_MOOD '.'
		| me_group   NEGATION POS_MOOD '.'
		| me_group   NEG_EMO  
		| random_msg AND neg_msg
		;

me_group: ME   I_VERB
		;


random_msg  :   subject OTHER_VERB TIME nominal_group
			|	subject OTHER_VERB PREP OBJECT
			|   subject OTHER_VERB PREP COMPLEMENT
			|   subject OTHER_VERB COMPLEMENT
			|   TIME  OTHER_SUB  I_VERB POS_EMO
			|   TIME  OTHER_SUB  OTHER_VERB POS_EMO
			|   TIME  OTHER_SUB  I_VERB NEG_EMO
			|   TIME  OTHER_SUB  OTHER_VERB NEG_EMO
			;

subject: ME
	   | OTHER_SUB
	   ;


nominal_group:  ARTICLE  POS_MOOD  OBJECT
			 |  ARTICLE  NEG_MOOD  OBJECT
			 ;
