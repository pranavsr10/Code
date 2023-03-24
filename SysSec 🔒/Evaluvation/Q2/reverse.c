int rev(int n ) {
  int  reverse = 0, remainder;

  printf("Enter an integer: ");
  scanf("%d", &n);

  while (n != 0) {
    remainder = n % 10;
    reverse = reverse * 10 + remainder;
    n /= 10;
  }

  printf("The Reversed number is = %d", reverse);

  return 0;
}
