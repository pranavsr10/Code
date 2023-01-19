#include  <iostream>
using namespace std;
class DC
{
    private:
    int chapternumber;
    
    public:
    DC()
    {
        chapternumber = 0;
    }
    
    // void display()
    // {
    //     cout << " chapternumber: " << chapternumber << endl;
    // }
    
    friend int display2(DC &d);

};

int display2(DC &d)
{
    int a;
    a = d.chapternumber + 45;
    return a;
}

int main()
{
    DC superman;
    // superman.display();
    cout << "Chapter number : " <<  display2(superman);
    return 0;
}

