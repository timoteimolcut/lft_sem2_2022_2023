%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <graphics.h>
	#include <math.h>
	
	
	typedef struct _node {
		char type;
		int varPos;
		float value;
    	struct _node *first;
    	struct _node *second;
    	struct _node *third;
    } node;
	
	//valorile conditiilor
    int conditions[10];
    int nrOfCond = 0;


    //valorile expresiilor
    float expressions[50];
    int nrOfExp = 0;



    struct _node* allTrees[100];
    int nrOfTree = 0;

    //here are the variables sored
    float varValues[25];



	//division factor:  width (x=640) / hight (y=480)
	#define FACTOR (4/3.0f)
	//logical limit of the x and y e.g.  (x, y): (-Limit, -Limit) -> (Limit, Limit)
	#define LIMIT 10


	/**
		This logical values of x and y have to be transfered into the real value of the pixel that will
		be in the window. The scalling FACTOR is used to make the with and the height look like they have 
		the same module.

	*/

	node* createNode(char type, float value, int varPos, node* first, node* second, node* third);


	float* createMonom(float coef, float power);
	float* addMonoms(float* coefs1, float* coefs2);
	float* subMonoms(float* coefs1, float* coefs2);

	int getX(float x);
	int getY(float y);
	
	void drawPoly(float* coefs);
	void drawSinus(float* coefs);
	void drawCosinus(float* coefs);
	void drawExp(float b, float* coefs);


	void beginGrafix();
	void endGrafix();

	void draw(node* allTrees[]);
	void handleTree(node* tree);


	float* handleMonom(node* monom);
	float* handlePoly(node* poly);


	int nrOfTabs = 0;

%}

%token X CONST SIN COS DRAW
%token FOR VAR IN TO BY IF ELSE
%token PI E


%union{
	float number;
	char variable;
	float* coefs;
	struct _node* parseNode;
}

%type <number> CONST
%type <parseNode> monom polinom term assign 
%type <parseNode> cond if for statement /*exp*/
%type <variable> VAR

%nonassoc IFX
%nonassoc COMA




%%


program	: /*nothing*/
		|  program line 
			{}
		;


line:	polinom '\n'
		{
			allTrees[nrOfTree] = $1;
			nrOfTree++;
		}
	|	assign '\n'
		{
			allTrees[nrOfTree] = $1;
			nrOfTree++;
		}
	|	for '\n'
		{
			allTrees[nrOfTree] = $1;
			nrOfTree++;
		}
	|	if '\n'
		{
			allTrees[nrOfTree] = $1;
			nrOfTree++;
		}
	/*|	exp '\n'
		{
			allTrees[nrOfTree] = $1;
			nrOfTree++;
		}*/

	|	DRAW '\n'
		{
			draw(allTrees);
			exit(1);
		}
	;

for :	FOR VAR IN term TO term then statement
		{
			nrOfTabs--;
			$$ = createNode('f', 1, $2 - 'a', $8, $4, $6);
		}
	|	FOR VAR IN term TO term BY CONST then statement
		{
			nrOfTabs--;
			$$ = createNode('f', $8, $2 - 'a', $10, $4, $6);
		}
	;	

if 	:	IF cond then statement %prec IFX
		{
			nrOfTabs--;
			$$ = createNode('i', 0, 0, $2, $4, NULL);
		}
	|	IF cond then statement coma ELSE then statement 
		{
			nrOfTabs--;
			$$ = createNode('i', 0, 0, $2, $4, $8);
		}
	;

then: 	':' '\n'
		{
			nrOfTabs++;
			for(int i = 0; i < nrOfTabs; i++){
				printf("    ");	
			}
		}
 	;

coma: 	COMA 
		{
			nrOfTabs--;
			for(int i = 0; i < nrOfTabs; i++){
				printf("    ");	
			}
		}
 	;






cond:	VAR '=' '=' term
		{
			$$ = createNode('q', nrOfCond, $1 - 'a', $4, NULL, NULL);
			nrOfCond++;
		}
	|	VAR '>' term
		{
			$$ = createNode('>', nrOfCond, $1 - 'a', $3, NULL, NULL);
			nrOfCond++;
		}
	|	VAR '<' term
		{
			$$ = createNode('<', nrOfCond, $1 - 'a', $3, NULL, NULL);
			nrOfCond++;
		}
	|	VAR '>' '=' term
		{
			$$ = createNode('g', nrOfCond, $1 - 'a', $4, NULL, NULL);
			nrOfCond++;
		}
	|	VAR '<' '=' term
		{
			$$ = createNode('l', nrOfCond, $1 - 'a', $4, NULL, NULL);
			nrOfCond++;
		}
	|	VAR '<' '>' term
		{
			$$ = createNode('d', nrOfCond, $1 - 'a', $4, NULL, NULL);
			nrOfCond++;
		}
	

		/*

		partea de expresii nu am reusit sa o termin
		si am pus-o intru-un comentariu

		exp  :  term
		{
			node* zero = createNode('c', 0, 0, NULL, NULL, NULL);
			$$ = createNode('+', 0, nrOfExp, $1, zero, NULL);
			nrOfExp++;
		}
	 |  term '+' term
		{
			
			$$ = createNode('+', 0, nrOfExp, $1, $3, NULL);
			nrOfExp++;
		}
	 |  term '-' term
	 	{
	 		
	 		$$ = createNode('-', 0, nrOfExp, $1, $3, NULL);
	 		nrOfExp++;
	 	}
	 |  term '*' term
	 	{
	 		
	 		$$ = createNode('*', 0, nrOfExp, $1, $3, NULL);
	 		nrOfExp++;
	 	}
	 |  term '/' term
	 	{
	 		
	 		$$ = createNode('/', 0, nrOfExp, $1, $3, NULL);
	 		nrOfExp++;
	 	}
	 |  term '%' term
	 	{
	 		
	 		$$ = createNode('%', 0, nrOfExp, $1, $3, NULL);
	 		nrOfExp++;
	 	}
	 ;*/

	;







statement 	: 	assign
			|	polinom
			|	if
			|	for
			;



assign 	:  VAR '=' term
			{
				$$ = createNode('=', 1, $1 - 'a', $3, NULL, NULL);
			}
		|	VAR '=' '-' term
			{
				$$ = createNode('=', 0, $1 - 'a', $4, NULL, NULL);
			}
	 	;




polinom : 	'-' monom
			{
				node* coef = createNode('c', 0, 0, NULL, NULL, NULL);
				node* power = createNode('c', 0, 0, NULL, NULL, NULL);
				node* zero = createNode('m', 0, 0, coef, power, NULL);
				$$ = createNode('p', 0, 0, zero, $2, NULL);
			}
		| 	monom
			{
				node* coef = createNode('c', 0, 0, NULL, NULL, NULL);
				node* power = createNode('c', 0, 0, NULL, NULL, NULL);
				node* zero = createNode('m', 0, 0, coef, power, NULL);
				$$ = createNode('p', 1, 0, zero, $1, NULL);
			}
		| 	polinom '+' monom
			{
				$$ = createNode('p', 1, 0, $1, $3, NULL);
			}
		| 	polinom '-' monom
			{
				$$ = createNode('p', 0, 0, $1, $3, NULL);
			}
		|	SIN '(' polinom ')'
			{
				$$ = createNode('s', 1, 0, $3, NULL, NULL);
			}
		|	COS '(' polinom ')'
			{
				$$ = createNode('s', 0, 0, $3, NULL, NULL);
			}
		|	term '^' '(' polinom ')'
			{
				$$ = createNode('e', 0, 0, $1, $4, NULL);
			}
		;

monom   :  term X '^' term
			{
				$$ = createNode('m', 0, 0, $1, $4, NULL);
			}
		|  X '^' term
			{
				node* coef = createNode('c', 1, 0, NULL, NULL, NULL);
				$$ = createNode('m', 0, 0, coef, $3, NULL);
			}
		|  term X
			{	
				node* power = createNode('c', 1, 0, NULL, NULL, NULL);
				$$ = createNode('m', 0, 0, $1, power, NULL);
			}
		|  term
			{
				node* power = createNode('c', 0, 0, NULL, NULL, NULL);
				$$ = createNode('m', 0, 0, $1, power, NULL);
			}
		|  X
			{
				node* coef = createNode('c', 1, 0, NULL, NULL, NULL);
				node* power = createNode('c', 1, 0, NULL, NULL, NULL);
				$$ = createNode('m', 0, 0, coef, power, NULL);
			}
		;


term	:	CONST
			{
				$$ = createNode('c', $1, 0, NULL, NULL, NULL);
			}
		|	PI
			{
				$$ = createNode('c', 3.141592, 0, NULL, NULL, NULL);
			}
		|	E
			{
				$$ = createNode('c', 2.718281, 0, NULL, NULL, NULL);
			}
		|	VAR
			{
				$$ = createNode('v', 0, $1 - 'a', NULL, NULL, NULL);
			}
		;

%%

node* createNode(char type, float value, int varPos, node* first, node* second, node* third){
	node* p = (node*)malloc(sizeof(node));
	p->type = type;
   	p->value = value;
   	p->varPos = varPos;
   	p->first = first;
   	p->second = second;
   	p->third = third;
   	return p;
}


void handleTree(node* tree){
	if(tree != NULL){
		switch(tree->type){
			case 'p' :  drawPoly(handlePoly(tree));
						break;
			case 's' :  if(tree->value == 1){
							drawSinus(handlePoly(tree->first));
						}else if(tree->value == 0){
							drawCosinus(handlePoly(tree->first));
						}
						break;
			case 'e' :  if(tree->first->type == 'c'){
							drawExp(tree->first->value, handlePoly(tree->second));
						} else if(tree->first->type == 'v'){
							drawExp(varValues[tree->first->varPos], handlePoly(tree->second));
						}
						break;
			case '=' :  if((int)tree->value == 1){
							if(tree->first->type == 'c'){
								varValues[tree->varPos] = tree->first->value;
							}else if(tree->first->type == 'v'){
								varValues[tree->varPos] = varValues[tree->first->varPos];
							}
						} else if((int)tree->value == 0){
							if(tree->first->type == 'c'){
								varValues[tree->varPos] = -tree->first->value;
							}else if(tree->first->type == 'v'){
								varValues[tree->varPos] = -varValues[tree->first->varPos];
							}
						}

						break;

			//some conditions

			//equals
			case 'q' :  if(tree->first->type == 'c'){
							if(varValues[tree->varPos] == tree->first->value){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}else if(tree->first->type == 'v'){
							if(varValues[tree->varPos] == varValues[tree->first->varPos]){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}
						break;

			//greater
			case '>' :  if(tree->first->type == 'c'){
							if(varValues[tree->varPos] > tree->first->value){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}else if(tree->first->type == 'v'){
							if(varValues[tree->varPos] > varValues[tree->first->varPos]){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}
						break;

			//lower
			case '<' :  if(tree->first->type == 'c'){
							if(varValues[tree->varPos] < tree->first->value){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}else if(tree->first->type == 'v'){
							if(varValues[tree->varPos] < varValues[tree->first->varPos]){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}
						break;

			//greater equal
			case 'g' :  if(tree->first->type == 'c'){
							if(varValues[tree->varPos] >= tree->first->value){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}else if(tree->first->type == 'v'){
							if(varValues[tree->varPos] >= varValues[tree->first->varPos]){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}
						break;

			//lower equal
			case 'l' :  if(tree->first->type == 'c'){
							if(varValues[tree->varPos] <= tree->first->value){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}else if(tree->first->type == 'v'){
							if(varValues[tree->varPos] <= varValues[tree->first->varPos]){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}
						break;

			//different
			case 'd' :  if(tree->first->type == 'c'){
							if(varValues[tree->varPos] != tree->first->value){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}else if(tree->first->type == 'v'){
							if(varValues[tree->varPos] != varValues[tree->first->varPos]){
								conditions[(int)tree->value] = 1;//true
							}else{
								conditions[(int)tree->value] = -1;//false
							}
						}
						break;


			//expressions

			//add
			case '+' :  if(tree->first->type == 'c'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = tree->first->value + tree->second->value;
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = tree->first->value + varValues[tree->second->varPos];
							}
						} else if(tree->first->type == 'v'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = varValues[tree->first->varPos] + tree->second->value;
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = varValues[tree->first->varPos] + varValues[tree->second->varPos];
							}
						}
						printf("here: %f\n", expressions[tree->varPos]);
						break;

			//sub
			case '-' :  if(tree->first->type == 'c'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = tree->first->value - tree->second->value;
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = tree->first->value - varValues[tree->second->varPos];
							}
						} else if(tree->first->type == 'v'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = varValues[tree->first->varPos] - tree->second->value;
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = varValues[tree->first->varPos] - varValues[tree->second->varPos];
							}
						}
						printf("here: %f\n", expressions[tree->varPos]);
						break;

			//multiply
			case '*' :  if(tree->first->type == 'c'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = tree->first->value * tree->second->value;
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = tree->first->value * varValues[tree->second->varPos];
							}
						} else if(tree->first->type == 'v'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = varValues[tree->first->varPos] * tree->second->value;
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = varValues[tree->first->varPos] * varValues[tree->second->varPos];
							}
						}
						printf("here: %f\n", expressions[tree->varPos]);
						break;

			//devide
			case '/' :  if(tree->first->type == 'c'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = tree->first->value / tree->second->value;
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = tree->first->value / varValues[tree->second->varPos];
							}
						} else if(tree->first->type == 'v'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = varValues[tree->first->varPos] / tree->second->value;
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = varValues[tree->first->varPos] / varValues[tree->second->varPos];
							}
						}
						printf("here: %f\n", expressions[tree->varPos]);
						break;

			//modulo
			case '%' :  if(tree->first->type == 'c'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = (int)(tree->first->value) % (int)(tree->second->value);
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = (int)(tree->first->value) % (int)(varValues[tree->second->varPos]);
							}
						} else if(tree->first->type == 'v'){
							if(tree->second->type == 'c'){
								expressions[tree->varPos] = (int)(varValues[tree->first->varPos]) % (int)(tree->second->value);
							} else if(tree->second->type == 'v'){
								expressions[tree->varPos] = (int)(varValues[tree->first->varPos]) % (int)(varValues[tree->second->varPos]);
							}
						}
						printf("here: %f\n", expressions[tree->varPos]);
						break;




			//if
			case 'i' :  if(tree->third == NULL){
							handleTree(tree->first);
							if(conditions[(int)tree->first->value] == 1){
								handleTree(tree->second);
							}
						} else {
							handleTree(tree->first);
							if(conditions[(int)tree->first->value] == 1){
								handleTree(tree->second);
							}else if(conditions[(int)tree->first->value] == -1){
								handleTree(tree->third);
							}
						}
						break;

			//for
			case 'f' :  if(tree->second->type == 'c'){
							if(tree->third->type == 'c'){
								for(varValues[tree->varPos] = tree->second->value; varValues[tree->varPos] <= tree->third->value; varValues[tree->varPos] += tree->value){
									handleTree(tree->first);
								}
							} else if(tree->third->type == 'v'){
								for(varValues[tree->varPos] = tree->second->value; varValues[tree->varPos] <= varValues[tree->third->varPos]; varValues[tree->varPos] += tree->value){
									handleTree(tree->first);
								}
							}
						} else if(tree->second->type == 'v'){
							if(tree->third->type == 'c'){
								for(varValues[tree->varPos] = varValues[tree->second->varPos]; varValues[tree->varPos] <= tree->third->value; varValues[tree->varPos] += tree->value){
									handleTree(tree->first);
								}
							} else if(tree->third->type == 'v'){
								for(varValues[tree->varPos] = varValues[tree->second->varPos]; varValues[tree->varPos] <= varValues[tree->third->varPos]; varValues[tree->varPos] += tree->value){
									handleTree(tree->first);
								}
							}
						}

						break;

			default  :  break;
		}
	}
}

void draw(node* allTrees[]){
	beginGrafix();
	for(int i = 0; i < 10; i++){
		handleTree(allTrees[i]);
	}
	endGrafix();
}


float* handleMonom(node* monom){
	if(monom != NULL){
		if(monom->first->type == 'c'){
			if(monom->second->type == 'c'){
				return createMonom(monom->first->value, monom->second->value);
			}
			if(monom->second->type == 'v'){
				return createMonom(monom->first->value, varValues[monom->second->varPos]);
			} 
		}
		if(monom->first->type == 'v'){
			if(monom->second->type == 'c'){
				return createMonom(varValues[monom->first->varPos], monom->second->value);
			}
			if(monom->second->type == 'v'){
				return createMonom(varValues[monom->first->varPos], varValues[monom->second->varPos]);
			} 
		}
	}
	return createMonom(0, 0);
}


float* handlePoly(node* poly){
	if(poly != NULL){

		if(poly->first->type == 'm' && poly->second->type == 'm'){

			//add the monoms
			if(poly->value == 1){
				return addMonoms(handleMonom(poly->first), handleMonom(poly->second));
			}
			
			//sub the monoms
			if(poly->value == 0){
				return subMonoms(handleMonom(poly->first), handleMonom(poly->second));
			}
		}

		if(poly->first->type == 'p'){
			//add
			if(poly->value == 1){
				return addMonoms(handlePoly(poly->first), handleMonom(poly->second));
			}
			
			//sub
			if(poly->value == 0){
				return subMonoms(handlePoly(poly->first), handleMonom(poly->second));
			} 
		}		
	}
	return createMonom(0, 0);
}








float* createMonom(float coef, float power){
	float* coefs = (float*)calloc(20, sizeof(float));
	if(coefs == NULL){
		printf("no more memory\n");
		exit(1);
	}
	coefs[(int)power+10] = coef;
	return coefs;
}


float* addMonoms(float* coefs1, float* coefs2){
	float* poli = createMonom(0, 0);
	for(int i = 0; i < 20; i++){
		poli[i] = coefs1[i] + coefs2[i];
	}
	return poli;
}

float* subMonoms(float* coefs1, float* coefs2){
	float* poli = createMonom(0, 0);
	for(int i = 0; i < 20; i++){
		poli[i] = coefs1[i] - coefs2[i];
	}
	return poli;
}


//the x value for the window
int getX(float x){
	return FACTOR * (x * 240 / LIMIT) + 320;
}

//the y value for window
int getY(float y){
	return -(y * 240 / LIMIT) + 240;
}

float valueOfPoly(float* coefs, float x){
	float value = 0.0f;
	
	for(int i = -10; i < 10; i++){
		if(coefs[i+10] != 0){
			value += pow(x, i) * coefs[i+10];	
		}
	}
	return value;
}

void drawPoly(float* coefs){
	int newX, newY;
	for(float x = - LIMIT; x < LIMIT; x += 0.0001f){
		newX = getX(x);
		newY = getY(valueOfPoly(coefs, x));
		if(newX < 0 || newX > 640 || newY < 0 || newY > 480){
			continue;
		}
		putpixel(newX, newY, WHITE);
	}
}



void drawSinus(float* coefs){
	int newX, newY;
	for(float x = - LIMIT; x < LIMIT; x += 0.0001f){
		newX = getX(x);
		newY = getY(sin(valueOfPoly(coefs, x)));
		if(newX < 0 || newX > 640 || newY < 0 || newY > 480){
			continue;
		}
		putpixel(newX, newY, WHITE);
	}	
}

void drawCosinus(float* coefs){
	int newX, newY;
	for(float x = - LIMIT; x < LIMIT; x += 0.0001f){
		newX = getX(x);
		newY = getY(cos(valueOfPoly(coefs, x)));
		if(newX < 0 || newX > 640 || newY < 0 || newY > 480){
			continue;
		}
		putpixel(newX, newY, WHITE);
	}
}

void drawExp(float b, float* coefs){
	int newX, newY;
	for(float x = - LIMIT; x < LIMIT; x += 0.0001f){
		newX = getX(x);
		newY = getY(pow(b, valueOfPoly(coefs, x)));
		if(newX < 0 || newX > 640 || newY < 0 || newY > 480){
			continue;
		}
		putpixel(newX, newY, WHITE);
	}
}


void beginGrafix(){
	//initialise the graph
	int gd = DETECT, gm; 
	initgraph(&gd, &gm, "");

	//axis
	line(0, 240, 640, 240);
	line(320, 0, 320, 480);
	//borders
	line(0, 0, 0, 480);
	line(0, 0, 640, 0);
	line(639, 0, 639, 480);
	line(0, 479, 640, 479);
	
}

void endGrafix(){
	//delay the closing
	getchar();
	closegraph();
}




