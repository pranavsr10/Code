#include <iostream>
using namespace std;
 
class Student {
    public:
    Student() 
    {
        cout << " Student " << endl;
    }

};

class Engineer {
    public:
    Engineer()
    {
        cout << " Engineer " << endl;
    }

};

class Suganth {
    public:
    Suganth()
    {
        cout << "Suganth" << endl;
    }
};

class Amrita: public Student , public Engineer , public Suganth {
    public:
    Amrita()
    {
        cout << " Amrita" << endl;
    }
};


int main()
{
    Amrita r1;
    return 0;
}