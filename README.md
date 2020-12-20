# SQL Homework - Employee Database: A Mystery in Two Parts

## Introduction

It is a beautiful spring day, and it is two weeks since you have been hired as a new data engineer at Pewlett Hackard. Your first major task is a research project on employees of the corporation from the 1980s and 1990s. All that remain of the database of employees from that period are six CSV files.

The objective of this homework is to design tables to hold data in the CSVs, import the CSVs into a SQL database, and answer various questions about the data. 

With a complete database, we answer the following questions

1. List the following details of each employee: employee number, last name, first name, sex, and salary.


2. List first name, last name, and hire date for employees who were hired in 1986.

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

4. List the department of each employee with the following information: employee number, last name, first name, and department name.

5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

![](EmployeeSQL/images/pic1.png)

![](EmployeeSQL/images/pic2.png)


## ERD
Using the provided csv files, create an Entity-Relationship-Diagram

![](EmployeeSQL/images/SQL_ERD.png)


Create a histogram to show the most common salary ranges for employees
![](EmployeeSQL/images/ave_salary.png)



Programs used:\
Jupyter Notebook\
Postgres.





