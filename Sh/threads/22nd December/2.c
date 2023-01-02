#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void *printWelcomeMessage(void *names) {

    sleep(1);
    long name = (long)names;
    printf("\n[THREAD] Hello, Welcome %ld.", name);
    pthread_exit(NULL);

}

int main () {

   // thread defintion
   pthread_t threads[7];
   
   // parameter to be passed to the called function - printWelcomeMessage
   char names[10][15] = {"Amritha","Praveen","Saurabh","Sangeetha","Lakshmy","Srinivasan","Ramaguru"};
   
   int result;
   
   for(int i = 0; i < 7; i++ ) {
   
      printf("\n[MAIN] Creating thread, %d", i);
      // Creating the threading and thus calling the function with parameter passed to it
      sleep(1);
      result = pthread_create(&threads[i], NULL, printWelcomeMessage, (void *)&threads[i]);
      
   }
   
   // Exit the thread
   pthread_exit(NULL);
  return 0; 
}
