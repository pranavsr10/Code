#include <stdio.h>

int main() {
    // Sample array with 5 elements
    int arr[5] = {1, 2, 3, 4, 5};
    int *p; 
    int value = 7; // The value to be inserted
    int index = 2; // The index position where the value will be inserted
    
    int size = 5; // Get the size of the array
    
    // Shift the elements to the right to make room for the new value
    for (int i = size - 1; i >= index; i--) {
        arr[i + 1] = arr[i];
    }
    
    // Insert the new value at the specified index position
    arr[index] = value;
    
    // Print the updated array
    printf("Updated Array: ");
    for (int i = 0; i < size + 1; i++) {
        printf("%d ", arr[i]);
    }
    p = &value;
    printf("%x", &p); 
    return 0;
}

