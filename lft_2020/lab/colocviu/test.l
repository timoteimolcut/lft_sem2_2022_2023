%{
	#include "y.tab.h"
%}


%%


I 									return ME;

you|he|she 							return OTHER_SUB;

feel|was|am							return I_VERB;

are|is|went|saw						return OTHER_VERB;

him|her								return COMPLEMENT;

to|by								return PREP;

no|not								return NEGATION;

("so ")?happy|cheerful|contendent	return POS_MOOD;

("so ")?sad|heartbroken|pessimistic	return NEG_MOOD;

((T|t)oday)|((Y|y)esterday)			return TIME;

school|store|movie|bike|car|bus		return OBJECT;

":)"|":-)"|":-]"|":->"				return POS_EMO;

":("|":-("|":-["|":-<"				return NEG_EMO;


and									return AND;

a|an								return ARTICLE;

\n|"."    							return *yytext;


[ \t]								|
.									;

