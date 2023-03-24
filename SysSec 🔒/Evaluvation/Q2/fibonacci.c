int fibonacci(int n) {
        int num1 = 0, num2 = 1, temp, flag = 0;

        /* get the input from the user */
        printf("Enter ur input:");
        scanf("%d", &n);

        /* 0 and 1 are fibonacci numbers */
        if (n == num1 || n == num2) {
                printf("%d is a fibonacci number\n", n);
                return 0;
        }

        /* checking whether a given number is fobonacci no or not */
        while (num2 <= n) {
                temp = num2;
                num2 = num1 + num2;
                num1 = temp;
                if (num2 == n) {
                        flag = 1;
                        break;
                }
        }

        /* print the results */
        if (flag) {
                printf("%d is a fibonacci number\n", n);
        } else {
                printf("%d is not a fibonacci number\n", n);
        }
        return 0;
  }

