#include <iostream>
using namespace std;
class pointer
{
    public:
    int a;
    int b;
};

int main()
{
  pointer object;
  pointer *ptr ;
  ptr = &object;
  cout << "The value" << object.a << object.b << endl;
  cout << ptr->a;
  return 0;
}
