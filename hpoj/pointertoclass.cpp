#include <iostream>
using namespace std;
class pointer
{
    public:
    int a = 56;
    int b = 72;
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
