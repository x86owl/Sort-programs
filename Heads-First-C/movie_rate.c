#include <stdio.h>

int main(){

	int user_input = '\0';	// To store 10, or A

	puts("Enter an number between 1 - 10 : ");
	scanf("%d", &user_input);

	while(user_input != 0){

		if (user_input <= 3){
			puts("Terrible!");
			break;
		}
		else if( user_input <= 6){
			puts("Okay I guess");
			break;
		}
		else if(user_input == 7 || user_input == 8){
			puts("Pretty good");
			break;
		}
		else if(user_input == 9 || user_input == 10){
			puts("Masterpiece!!");
			break;
		}
		else{
			continue;
		}
	}

	return 0;
}

		
		

