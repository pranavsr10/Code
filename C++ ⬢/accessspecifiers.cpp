#include <iostream>
#include <string>

using namespace std;

class Employee
{
public:
  string name;
  void set_salary(double potential_salary)
  {
    if (potential_salary < 0) salary = 0;
    else salary = potential_salary;
  }
  double get_salary()
  {
    return salary;
  }
  void print_bonus()
  {
    cout << name << " bonus: " << calculate_bonus() << endl;
  }
private:
  double salary;
  double calculate_bonus()
  {
    return salary * 0.10;
  }
  
};

int main()
{
  Employee employee1;
  employee1.name = "Kevin";
  cout << employee1.name << endl;
  employee1.set_salary(50000);
  cout << "salary: " << employee1.get_salary() << endl;
  employee1.print_bonus();
  return 0;
}