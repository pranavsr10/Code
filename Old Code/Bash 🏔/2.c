/*#include<stdio.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<stdlib.h>
#include<fcntl.h>
int main()
{
    int n;
    char buffer[100];
    int fd;
    int p;
    int q;
    p=fork();
    if(p==0)
    {
        fd=open("a.txt",O_CREAT,0777);
printf("File is created");

close(fd);
    }

    else
    {
fd=open("a.txt",O_RDWR);
n=read(0,buffer,100);
write(fd,buffer,n);
}
return 0;
}
*/
//PC Using SM
#include<stdio.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<stdlib.h>
#include<fcntl.h>
int main(){
char buff[100];
void * shared_mem;
int shmid;
shmid=shmget((key_t)1243,1024,0666|IPC_CREAT);
shared_mem=shmat(shmid,NULL,0);
read(0,buff,100);
strcpy(shared_mem,buff);
}
