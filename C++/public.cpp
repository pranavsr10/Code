#include <iostream>
#include <list>
using namespace std;

class Phone {
    public:
        string Brand ;
        string Model;
};

int main (){
    Phone Iphone;
    cout << " Enter the brand of the Iphone : " << endl;
    cin >> Iphone.Brand ;
    cout << " Enter the model of the Iphone : " << endl;
    cin >> Iphone.Model;
     
    cout << " The brand of the iphone is " << Iphone.Brand << endl;
    cout << " The model of the iphone is " << Iphone.Model << endl;

    


}