#include <stdio.h>
#include <unistd.h>

int main(){
//     fork();
//     fork();
//     fork();
//    printf("Hello World from id:\n");
   // if (id == 0 ){
   //   printf("Hello from the child process\n");
   // }   
   // else {
   //  printf("Hello from the parent\n");
   // }
int id = fork();
if (id != 0) {
  fork();
}

printf("Hello World\n");
}
