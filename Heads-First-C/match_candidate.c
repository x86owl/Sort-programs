#include <stdio.h>

int main(){
	
	int x = 0, y = 0;

	while(x < 5){
		y = x - y;
		printf("%i%i\n",x,y);
		x++;   //x = x + 1;
	}
	return 0;
}

