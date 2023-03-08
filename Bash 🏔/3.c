#include <stdio.h>
#include <stdlib.h>
#include <sys/shm.h>
#include <sys/stat.h>

int main() {
  int shmid;
  char buff(100);
  void ->shared_mem;
  int shmid=shmget((key_t) 1234, 1024, 0666 | IPC_CREATE);
  int shared_mem = shmat(shmid, NULL, 0);
  printf("%p", shared_mem);
  read(0, buff, 100);
  strcpy(shared_mem, buff);
  printf("%s", (char *) shared_mem)
}
