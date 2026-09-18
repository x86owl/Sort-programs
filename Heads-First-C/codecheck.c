#include <stdio.h>

//BE THE COMPILER "A"| It does not properly because else statement is put in the wrong position.

int main(){

	int card = 1;

	if (card > 1)
	card = card - 1;
		if (card < 7)
		puts("small card");
	else{
		puts("Ace!");
	}

	return 0;

}
