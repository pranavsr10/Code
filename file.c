#include <stdio.h>
int main(int argc, char *argv[])
{
int val = 0, n = 10;
printf("Value before loop is %d\n", val);
for(int i = 0; i < n; i++)
{
val = i;
printf("%d \n", val );
}
printf("%d", val);
return 0;
}
