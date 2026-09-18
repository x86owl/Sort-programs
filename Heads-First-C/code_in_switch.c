#include <stdio.h>
#include <stdlib.h>

// Rewriting the if else card statements to the switch conditions 

int main(){

	char card_name[3];
	int val = 0;

	puts("Enter a card name: ");
	scanf("%2s", card_name);


	switch(card_name[0]){
		case 'K':
		case 'Q':
		case 'J':
			val = 10;
			break;
		case 'A':
			val = 11;
			break;
		default:
			val = atoi(card_name);
	}

	return 0;
}
