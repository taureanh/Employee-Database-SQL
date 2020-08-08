-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INTEGER   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" INTEGER   NOT NULL,
    "emp_title" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

select * from employees

--1
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
inner join salaries on
employees.emp_no = salaries.emp_no;


--2
select emp_no, last_name, first_name, hire_date
from employees
where hire_date >= '1986-01-01 00:00:00'  and hire_date < '1987-01-01 00:00:00';

--3
select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name
from departments
inner join dept_manager on departments.dept_no = dept_manager.dept_no
inner join employees on dept_manager.emp_no = employees.emp_no;

--4
select employees.emp_no, departments.dept_name,  employees.last_name, employees.first_name
from departments
inner join dept_emp on departments.dept_no = dept_emp.dept_no
inner join employees on employees.emp_no = dept_emp.emp_no
order by emp_no asc;

--5
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

--6
select employees.emp_no, departments.dept_name,  employees.last_name, employees.first_name
from departments
inner join dept_emp on departments.dept_no = dept_emp.dept_no
inner join employees on employees.emp_no = dept_emp.emp_no
where dept_name ='Sales'
order by emp_no asc;

--7
select employees.emp_no, departments.dept_name,  employees.last_name, employees.first_name
from departments
inner join dept_emp on departments.dept_no = dept_emp.dept_no
inner join employees on employees.emp_no = dept_emp.emp_no
where dept_name ='Sales' or dept_name= 'Development'
order by emp_no asc;

--8
select last_name,count(last_name) as Frequency 
from employees 
group by last_name
order by frequency desc;





