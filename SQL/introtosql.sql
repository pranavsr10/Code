CREATE TABLE Employee(
  Name char(5),
  phone_number int(10),
  Department_name varchar2(255)
  ID varchar2(255) NOT NUll,
  PRIMARY KEY(ID),
  FOREIGN KEY(Department_name) REFERENCES COMPANY(Department_name)
);

INSERT INTO Employee VALUES ( 'Suganth' , '6385389461' , 'CYS21' , 'CB.EN.U4CYS21076');

ALTER TABLE Employee Add Address varchar2(255);

SELECT Department_name FROM Employee where Department_name = 'CYS21';

SELECT ID , Department_name FROM Employee Natural join COMPANY order by ID asc;

SELECT ID , Department_name as Department FROM Employee;

SELECT avg(Salary) from Employee where Department_name='CYS21';

SELECT distinct course_id from section where semester="fall" and year="2009" and course_id in ( SELECT distinct course_id from section where semester="spring" and year="2009");

select Employee.ID , Employee.Name from Employee Inner join Company on company.ID = Employee.ID ;



