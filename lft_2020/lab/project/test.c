#include <graphics.h>
#include <math.h>
#include <stdlib.h>
#include <stdio.h>



//division factor:  width (x=640) / hight (y=480)
#define FACTOR (4/3.0f)
//logical limit of the x and y e.g.  (x, y): (-Limit, -Limit) -> (Limit, Limit)
#define LIMIT 10


/**
	This logical values of x and y have to be transfered into the real value of the pixel that will
	be in the window. The scalling FACTOR is used to make the with and the height look like they have 
	the same module.

*/


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
	
	for(int i = 0; i < 10; i++){
		if(coefs[i] != 0){
			value += pow(x, i) * coefs[i];	
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
	//origin of axis
	outtextxy(322, 242, "(0, 0)");
}

void endGrafix(){
	//delay the closing
	getchar();
	closegraph();
}

int main(int argc, char const *argv[]) {

	float coefs[] = {2, 0, 1, 0, 0, 0, 0, 0, 0, 0};
	
	beginGrafix();
		
	for(float i = 0; i < 1; i += 0.1f){
		
		coefs[2] = i;
		drawPoly(coefs);
	}
	
	//drawPoly(coefs);

	/*for(int i = 0; i < 3; i++){
		coefs[0] = i;
		drawSinus(coefs);
	}*/



	//drawCosinus(coefs);

	endGrafix();
	return 0;
}