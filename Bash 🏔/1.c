#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main()
{
pid_t p=fork();

if (p == 0) {
    printf("Child PID %d.\n",getpid());
    printf("Parent PID %d.\n",getppid());
}

else{
        printf("Prent PID %d.\n",getpid());
        printf("Child PID %d.\n",p);
    }

printf("\n");
printf("Done message");
return 0;
}
