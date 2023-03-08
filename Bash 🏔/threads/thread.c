#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>

void *mythread(void *int)
{
  sleep(1);
  printf("From Thread Process\n");
}

int main()
{}
