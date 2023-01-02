// #include <stdio.h>
// int main(){
//   int i , n,bt[100];
//   int wt[50],tat[100];
//   printf("Enter the number of values:\n");
//   scanf("%d",&n);
//   printf("Enter %d value for burst time\n");
//   for(int i=0;i<n;i++)
//     printf("burst time %d :", i+1);
//     scanf("%d", &bt[i]);
// }
// printf("\n\n");
// wt[0] = 0;
// for( int j=1 ; j < n +1 ; j++){
//   wt[j]=wt[j-1]+bt[j-1];
//   printf("Waiting time %d : %d\n", j , wt[j-1]);
// }
// printf("\n\n");
// for( int k =0 ; k < n ; k++){
//   tat[k]=bt[k]+wt[k];
//   printf("Turn Around time %d : %d\n", k+1 , tat[k]);
// }
// }
//

#include <stdio.h>

int main() {
  
  printf("Enter the number of processes: ");
  int n;
  scanf("%d", &n);
  int process_num[n];
  int burst_time[n];
  int waiting_time[n];
  int turn_around_time[n];
  float average_wating_time = 0;
  float average_turn_around_time = 0;


  //getting input for process numbers
  
  printf("Enter process IDs: \n");
  for (int i = 0; i < n; i++) {
    scanf(" %d", &process_num[i]);
  }


  printf("Enter burst time for each process: \n");
  for (int i = 0; i < n; i++) {
    scanf(" %d", &burst_time[i]);
  }

  //calculating waiting_time
  for (int i = 1; i < n; i++) {
    waiting_time[i] = burst_time[i-1] + waiting_time[i-1];
  }

  //calculating turn_around_time
  for (int i = 0; i < n; i++) {
    turn_around_time[i] = waiting_time[i] + burst_time[i];
  }

  //sum of waiting time
  for (int i = 0; i < n; i++) {
    average_wating_time += waiting_time[i];
  }

  average_wating_time = average_wating_time / n;

  //calculating average_turn_around_time
  for (int i = 0; i < n; i++) {
    average_turn_around_time += turn_around_time[i];
  }

  average_turn_around_time = average_turn_around_time / n;
  

  printf("Process ID\t BT\tWT\tTAT\n");
  for (int i = 0; i < n; i++) {
    printf("%d\t\t%d\t%d\t%d\n",process_num[i] ,burst_time[i], waiting_time[i], turn_around_time[i]);
  }

  printf("Average waiting time: %.2f\n", average_wating_time);
  printf("Average turn around time: %.2f\n" ,average_turn_around_time);
  return 0;

}
