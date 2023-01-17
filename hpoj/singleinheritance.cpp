#include <iostream>
using namespace std;
class animal
{
  public:
    int legs = 4;
};

class Dog : public animal
{
  public:
    int tail = 1;
};

class Mani : public Dog
{
  public :
    int years = 4;
};

class cat
{
  public:
    int weight = 34;
};

class beluga : public animal , public cat 
{
  public:
    int insta = 6000 ;
};

int main()
{
  cout << "Inherited Properly" << endl;
}
