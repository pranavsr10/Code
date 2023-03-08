int divisible(int num){
    printf("\nEnter a number: ");
    scanf("%d", &num);

    if (num % 6 == 0) {
        printf("\n%d is divisible by 6.", num);
    } else {
        printf("\n%d is not divisible by 6.", num);
    }
}
