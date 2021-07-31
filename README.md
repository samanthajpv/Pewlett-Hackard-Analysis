# Pewlett-Hackard-Analysis

## Project Overview
Pewlett Hackard is a company facing an upcoming shift in their organization due to a large number of retiring employees. The company is starting to look at who should be offered a retirement package and evaluate positions that need to be filled. The purpose of this project was to create an employee database from the company's six csv files using SQL (Structure Query Language).

### Resources
- Data:
    - [departments.csv](Data/departments.csv)
    - [dept_emp.csv](Data/dept_emp.csv)
    - [dept_manager.csv](Data/dept_manager.csv)
    - [employees.csv](Data/employees.csv)
    - [salaries.csv](Data/salaries.csv)
    - [titles.csv](Data/titles.csv)
- [Queries](Queries/Employee_Databse_challenge.sql)
- Software:
    - QuickDBD
    - PostgreSQL 12.7
    - pgAdmin 4 v5.4

## Results 

### Entity Relationship Diagram
INSERT PHOTO
The relationships between tables were established using QuickDBD, an online application for creating database diagrams. From the diagram, it can be seen that the emp_no (employee number) and dept_no (department number) are the keys used to connect the tables. It was set up as a primary key in the departments and employees table, while a foreign key in other tables. This was used as a guide in creating the employee database tables before importing the csv files in PostgreSQL.

### Analysis Deliverables

- Retirement Titles
The Employees and Titles tables were joined where data was filtered to those who were born between 1952 and 1955. The company has determined that any employee born between those years will begin to retire. The problem with this query as seen in the image above is that there are duplicates due to the fact that employees may have changed titles over the years. 
- Unique Titles
From the output in the Retirement Titles, Unique Titles table was created to reflect only the most recent job title of the employees. This was done by using the ```DISTINCT ON``` statement. In addition, the active employees have 1/1/9999 as their to_date in the titles table, hence the reason why data was ordered by the to_date in descending order.
- Retiring Titles
Based on the Unique Titles table, the ```COUNT()``` function was used get the number of titles. The data was then grouped by the titles to form the Retiring Titles tables. This will help give the company an overview of the positions need to be filled in the near future.
- Mentorship Eligibility
For the Mentorship Eligibility, the tables for Employees, Department Employee, and Titles were joined. Data was filtered to all the current employees (to_date of 1/1/9999) and those who were born in the year 1965. The purpose of creating this table is to help the company prepare employees for more senior or leadership roles, taking on the positions that will soon be vacated. This will also make way for new employees that will be hired.

## Summary 
The upcoming "silver tsunami" in Pewlett Hackard will require a lot of strategic planning. To see how this will affect the whole organization will help the company smoothly transition employees to different roles.

- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
The Retiring Titles table show that there is a huge amount of employees that will soon retire.

- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
- from the active employees, get all possible combinations of departments and positions with more senior job titles.
## Reference
(1) Trilogy Education Services. (2021, July). *Module 7 Challenge*. https://courses.bootcampspot.com/courses/626/assignments/13395?module_item_id=212712
