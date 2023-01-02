#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/shm.h>//shared memory header file
#include <string.h>
//Shared memory requires two codes for communication

char buffer[100];
void *sh_addr;//variable to store shared memory address
int shmid;
void main()
{

shmid=shmget((key_t)1892,1024,0666|IPC_CREAT);
sh_addr=shmat(shmid,NULL,0);
printf("Shared Memory Address: %p\n",sh_addr);
read(0,buffer,100);
strcpy(sh_addr,buffer);
printf("Written Details After copy: %s\n",(char *)sh_addr);
printf("Buffer Deatials: %s\n",buffer);

}



