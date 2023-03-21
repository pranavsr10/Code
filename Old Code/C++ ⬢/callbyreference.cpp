#include <iostream>
using namespace std;
void updatevalue (int &x){
    x = x + 100 ;
}
int main()
{ 
    int z;
    cout << " The value of the number before updating :" << endl;
    cin >> z;
    cout << " The value of the number after updating :" << z <<  endl;
    updatevalue(z);
    cout << " The value of the number after updating :" << z << endl ;
    return 0;
}