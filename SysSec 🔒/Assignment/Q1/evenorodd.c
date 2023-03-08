int count(int n) {
  int count = 0;
  printf("\nEnter an integer: ");
  scanf("%d", &n);
 
  // iterate at least once, then until n becomes 0
  // remove last digit from n in each iteration
  // increase count by 1 in each iteration
  do {
    n /= 10;
    ++count;
  } while (n != 0);

  printf("\nNumber of digits: %d", count);
}

