#include <iostream>
using namespace std;

class baseclass
{
  public:
  void operation()
  {
    cout << "Operation Performed" << endl;
  }
};

class derivedclass : public baseclass
{
    public:
    void operation()
    {
        cout << "Operation Done" << endl;
    }
};

int add(int arg1, int arg2)
{
  cout<<"Function 1" << endl;
  return (arg1 + arg2);
}

double add(double arg1, double arg2)
{
  cout<<"Function 2" << endl;
  return (arg1 + arg2);
}

int add(int arg1, int arg2, int arg3)
{
  cout<<"Function 3" << endl;
  return (arg1 + arg2 + arg3);
}

int main()
{
    derivedclass object;
    object.operation();
    cout<<add(4,5,7);
    return 0;
}



// int main()
// {
//   cout<<add(4,5,7);
// }