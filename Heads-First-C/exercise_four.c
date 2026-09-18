#include <stdio.h>


int main(){
	
	char suit = 'H';

	switch(suit){
		case 'C':
			puts("Club");
			break;
		case 'D':
			puts("Diamond");
			break;
		case 'H':
			puts("Heart");
			break;
		case 'L':
			puts("Love");
			break;
		default:
			puts("Jocker");
	}

	return 0;
}
