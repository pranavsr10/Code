#include<bits/stdc++.h>
using namespace std;
class encapsulation {
  private :
    int a , b , c;

  public :
    void set(int x , int y ){
      a = x;
      b = y ;
      sum ( a , b);
    }

    void sum(int e , int f){
      c = e + f ;
    }

    void get(){
      cout << " Sum of the numbers  " << a << "and" << b << "is "<< c << endl; 
    }
};

int main(){
   encapsulation object ;
   int a , b;
   cout << "Enter the first number :" << endl;
   cin >> a ;
   cout << "\nEnter the second number :" << endl;
   cin >> b;
   cout << "\n" << endl;
   object.set(a , b);
   object.get();
   return 0;
}















