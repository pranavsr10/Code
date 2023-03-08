#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

struct add {
    int a;
    int b;
};

void *printWelcomeMessage(void* var) {

    sleep(1);
    struct add *obj = var;
    int sum = obj->a + obj->b;
    printf("\n[THREAD] Hello, Sum is %d.", sum);
    pthread_exit(NULL);

}

int main () {

   // thread defintion
   pthread_t threads;   
   
   struct add var;
   var.a = 5;
   var.b = 5;

   int result;
   
   
      printf("\n[MAIN] Creating thread");
      // Creating the threading and thus calling the function with parameter passed to it
      result = pthread_create(&threads, NULL, printWelcomeMessage, &var);

   
   // Exit the thread
   pthread_exit(NULL);
  return 0; 
}
