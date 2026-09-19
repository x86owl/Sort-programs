#include <stdio.h>

/*
 1. Initialise the integer variable counter to 6
 2. While counter is more than 0
 3. We print the message
 4. counter will be equal to its own value minus 1
 5. it will continue until counter will be less or equal to 0 
*/

int main(){
	
	int counter = 6;

	while(counter > 0){
		puts("Code everyday, to become a good programmer");
		counter = counter - 1; 		// c-- is other way to do it
	}	

	return 0;
}
