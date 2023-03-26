#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>

struct node{
  int input; 
  struct node *next;
};

struct node *head = NULL;

int InsertingFromBegining(int val) {
  struct node *NewNode = (struct node *)malloc(sizeof(struct node));
  NewNode ->input = val;
  NewNode ->next = head;
  head = NewNode;
  printf("Inserted the %d value at the begining for the List. \n", val);
  return 0;
}

int InsertingFromEnd(int val) {
  struct node *NewNode = (struct node *)malloc(sizeof(struct node));
  NewNode ->input = val;
  NewNode ->next = NULL;
  if (head == NULL){
    head = NewNode;
    printf("Inserted the %d value at the ending of the list. \n",val);
  }
  struct node *temp = head;
  while (temp->next != NULL){
    temp = temp -> next;
  }
  temp->next = NewNode;
  printf("Inserted the %d value at the ending of the list. \n",val);
  return 0;
}

int InsertingAtIndex(int val , int index){
   if (index < 0) {
        printf("Invalid index. Please try again. \n");
        return 0;
   }
  struct node *NewNode = (struct node *)malloc(sizeof(struct node));
  NewNode -> input = val;
  if (index == 0){
    NewNode ->input = val;
    NewNode ->next = head;
    head = NewNode;
    printf("Inserted the %d value at the given index %d \n",val,index);
  }
  int i = 0;
  struct node* temp = head;
  while (i < index - 1 && temp != NULL) {
    temp = temp->next;
    i++;
  }
  if (temp == NULL){
    printf("Invalid index \n");
  }
  NewNode->next = temp->next;
  temp->next = NewNode;
  printf("Inserted the %d value at the given index %d \n",val,index);
  return 0;
}


// int InsertingAtIndex(int index, int val){
//   struct node *NewNode = (struct node *)malloc(sizeof(struct node));
//   NewNode->input = val;
//   if (head == NULL){
//     NewNode ->next = NULL;
//     head = NewNode;
//     printf("Value %d inserted at %d index. \n",val , index);
//     return 0;
//   }
//   struct node *temp = head;
//   for (int i = 0; i < index-1 ; i++){
//     if (temp ->next == NULL){
//       printf("Please provide a valid index.\n");
//       return 0;
//     }
//     temp = temp->next;
//   }
//   NewNode->next = temp->next;
//   temp->next = NewNode;
//   printf("Inserted the %d value at the given index %d \n", val , index);
//   return 0;
// }

int DeleteFromBegining(){
  if (head == NULL){
    printf("List is empty. \n");
    return 0;
}
  struct node *temp = head;
  head = head -> next;
  free(temp);
  printf("Deleted from begining. \n");
  return 0;
}

int DeleteFromEnd(){
  if (head == NULL){
    printf("List is Empty cannot proceed further.");
  }
  if (head ->next == NULL){
    free(head);
    head = NULL;
    printf("Deleted from End.\n");
    // return 0;
  }
  struct node *temp = head;
  while (temp->next->next != NULL){
    temp = temp ->next;
  }
  free(temp);
  temp = NULL;
  printf("Deleted from End. \n");
  return 0;
}

uint

int Traversal(){
  if (head == NULL){
    printf("List is Empty cannot proceed further.");
    return 0;
  }
  printf("Elements in the linked list are :");
  struct node *temp = head;
  while (temp != NULL){
    printf("%d \t", temp->input);
    temp = temp->next;
  }
  printf("\n");
  return 0;
}

int main(){
  int choice , val , index;
  while (1){
    printf("\nMenu-Driven Program:\n");
    printf("To Insert at beginning (1) \n");
    printf("To Insert at end (2) \n");
    printf("To Insert at a give index (3) \n");
    printf("To Delete from beginning (4)\n");
    printf("To Delete from end (5) \n");
    printf("To Traverse the list (6) \n");
    printf("To Exit (7) \n");
    printf("Enter your choice: ");
    scanf("%d", &choice);
    switch (choice) {
      case 1:
          printf("Enter the value to be inserted: ");
          scanf("%d", &val);
          InsertingFromBegining(val);
          printf("\n");
          Traversal();
          printf("#############################################################");
          break;
      case 2:
          printf("Enter the value to be inserted: ");
          scanf("%d", &val);
          InsertingFromEnd(val);
          printf("\n");
          Traversal();
          printf("#############################################################");
          break;
      case 3:
          printf("Enter the value to be inserted:");
          scanf("%d", &val);
          printf("\nEnter the index to be inserted to:");
          scanf("%d", &index);
          printf("\n");
          InsertingAtIndex(val, index);
          printf("\n");
          Traversal();
          printf("#############################################################");
          break;
      case 4:
          DeleteFromBegining();
          printf("\n");
          Traversal();
          printf("#############################################################");
          break;
      case 5:
          DeleteFromEnd();
          printf("\n");
          Traversal();
          printf("#############################################################"); 
          break;
      case 6:
          Traversal();
          printf("\n");          
          printf("#############################################################");
          break;
      case 7:
          exit(0);
          default:
      printf("Invalid choice.\n");
      printf("\n");
      printf("#############################################################");
      printf("How many alternate timelines , do i destroy the world \n");
    }
  }
}
