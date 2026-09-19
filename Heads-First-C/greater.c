#include <stdio.h>

int larger(int a, int b){

	if (a > b)
		return a;
	return b;
}

int main(){
	
	int num1, num2;
	puts("Enter two numbers to get which one is big: ");
	scanf("%d %d",&num1,&num2);	

	int big_num = larger(num1,num2);
	printf("%i is greatest!\n",big_num);

	return 0;
}
