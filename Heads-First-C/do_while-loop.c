#include <stdio.h>


int main(){
	
	int counter = 0;

	do{
		counter = counter + 1;
		printf("%i green bottles, hanging on the wall\n", counter);
	}while(counter < 10);

	return 0;
}
