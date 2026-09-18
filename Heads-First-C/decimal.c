#include <stdio.h>
#include <math.h>

long long  BinaryTodecimal(long long binaryNum);

int main(){

    long long binaryNum;
    printf("Enter a binary number: \n");
    scanf(" %lld", &binaryNum);

    printf("Decimal equivalent of %lld is : %lld\n", binaryNum, BinaryTodecimal(binaryNum));
	
    printf("Program run successfully.\n");
    return 0;
}

long long  BinaryTodecimal(long long binaryNum){
    long long decimalNum = 0, base = 1, reminder;

    while (binaryNum > 0){
        reminder = binaryNum % 10;  // Getting the last digit 0 or 1
        decimalNum = decimalNum + reminder  * base;
        binaryNum = binaryNum / 10;
        base = base * 2;
    }
    return decimalNum;
}
