// CB.EN.U4CYS21076 SUGANTH SARVESH
void printingnumber(int n) {
    printf("Enter a number to find its first digits:");
    scanf("%d", &n);
    if (n < 10) {
        printf("%d\n", n);
    } else {
        while (n >= 100) {
            n /= 10;
        }
        printf("%d\n",n);
    }
}
