#include <iostream>
using namespace std;
void swap(int* x , int* y){
    int temp = *x;
     *x = *y;
     *y = temp;
};
int main()
{
    int x , y ;
    cout << " Enter the values to swap :" << endl;
    cin >> x >> y;
    cout << " Values after swaping " << endl;
    swap(&x, &y);
    cout << " x = " << x << endl;
    cout << " y = " << y << endl;
    return 0;
}