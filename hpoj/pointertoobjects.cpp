#include <iostream>
using namespace std;
class number
{
  private:
  int a;
  public:
  void set()
  {
    cout << " Enter the value of a :" << endl;
    cin >> a ;
  };
  void get()
  {
    cout << " Get the value of a " << a << endl;
  }
};

int main()
{
  number object ;
  number *ptr;
  ptr = &object;
  ptr -> set();
  ptr -> get() ;
//   object.set();
}




// class Data
// {
// public:
// int a;
// void print()
// {
// cout << "a is "<< a;
// }
// };

// int main()
// {
// Data d, *dp;
// dp = &d; // pointer to object
// // pointer to data member 'a'
// int Data::*ptr=&Data::a;
// d.*ptr=10;
// d.print();
// dp->*ptr=20;
// dp->print();
// }


// #include <iostream>
// using namespace std;
// class pointer
// {
//     public:
//     int a;
//     int b;
// };

// int main()
// {
//   pointer object;
//   pointer *ptr ;
//   ptr = &object;
//   cout << "The value" << object.a << object.b << endl;
//   cout << ptr->a;
//   return 0;
// }
