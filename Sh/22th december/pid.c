#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main(){
     int id = fork();
     if (id == 0 ){
       sleep(2);
     }
     // printf("%d\n",getpid());
     printf("ID of the Parent : %d\n ID of the child : %d\n", getppid() , getpid());
}
