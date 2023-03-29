#include <stdio.h>

int main(int argc, char *argv[])
{
  int n , i , key , flag;

  printf("Enter the number of elements you want in the array :\n");
  scanf("%d" , &n);
  int arr[n];

  printf("Enter the values you want to enter in the array: \n");
  for (i=0 ; i < n ; i++){
    scanf("%d", &arr[i]);
  }
  
printf("Values in the list are: ");
 for(i=0; i<n; i++)
 {
 printf("%d", arr[i]);
 if(i == n-1)
 printf(".\n\n");
 else
 printf(", ");
}

printf("Enter the number you want to search:");
scanf("%d", &key);
for(i=0, flag=0; i<n; i++)
 {
 if(arr[i] == key)
 {
 printf("Value %d found at index %d\n", key, i);
 flag = 1;
 }
 }
 if(flag == 0)
 {
 printf("Value %d was not found in the list\n", key);
 }
  return 0;
}
