#include <iostream>
using namespace std;
class test
{
    int a , b ;
    public:
    void set(int a,int b)
    {
        this -> a = a;
        this -> b = b;
        cout << "The Object address is " << this << endl;
        cout << "Address is " << this -> a << endl;
        cout << "Address is " << this -> b << endl;
    }
};

int main()
{
    test t;
    t.set(10,23);
}