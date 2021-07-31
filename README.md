# Pewlett-Hackard-Analysis

## Project Overview
Pewlett Hackard is a company facing an upcoming shift in their organization due to a large number of retiring employees. The company is starting to look at who should be offered a retirement package and evaluate positions that need to be filled. The purpose of this project was to create an employee database from the company's six csv files using SQL (Structured Query Language).

### Resources
- Data:
    - [departments.csv](https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Data/1%20-%20departments.csv)
    - [dept_emp.csv](https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Data/2%20-%20dept_emp.csv)
    - [dept_manager.csv](https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Data/3%20-%20dept_manager.csv)
    - [employees.csv](https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Data/4%20-%20employees.csv)
    - [salaries.csv](https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Data/5%20-%20salaries.csv)
    - [titles.csv](https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Data/6%20-%20titles.csv)
- [Queries](https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Queries/Employee_Database_challenge.sql)
- Software:
    - QuickDBD
    - PostgreSQL 12.7
    - pgAdmin 4 v5.4

## Results 

### Entity Relationship Diagram
<p align="center">
    <img src="https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Additional%20Resources/EmployeeDB.png" width="325" height="350" align="center">
    <h5 align="center">Employee Database ERD</h5>
</p>

The relationships between tables were established using QuickDBD, an online application for creating database diagrams. From the diagram, it can be seen that the emp_no (employee number) and dept_no (department number) are the keys used to connect the tables. It was set up as a primary key in the departments and employees table, while a foreign key in other tables. This was used as a guide in creating the employee database tables before importing the csv files in PostgreSQL.

### Analysis Deliverables

- **Retirement Titles**
<p align="center">
    <img src="https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Additional%20Resources/retirement_titles.png" width="525" height="175" align="center">
    <h5 align="center">Retiring Employee Job Titles</h5>
</p>
The Employees and Titles tables were joined where data was filtered to those who were born between 1952 and 1955. The company has determined that any employee born between those years will begin to retire. The problem with this query as seen in the image above is that there are duplicates due to the fact that employees may have changed titles over the years. 

*Output File:* [retirement_titles.csv](https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Data/retirement_titles.csv)

- **Unique Titles**
<p align="center">
    <img src="https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Additional%20Resources/unique_titles.png" width="500" height="175" align="center">
    <h5 align="center">Unique Retiring Employee Job Titles</h5>
</p>

From the output in the Retirement Titles, Unique Titles table was created to reflect only the most recent job title of the employees. This was done by using the DISTINCT ON statement. In addition, the active employees have 1/1/9999 as their to_date in the Titles table, hence the reason why data was ordered by the to_date in descending order (see [query](https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Queries/Employee_Database_challenge.sql)).

*Output File:* [unique_titles.csv](https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Data/unique_titles.csv)

- **Retiring Titles**
<p align="center">
    <img src="https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Additional%20Resources/retiring_titles.png" width="210" height="190" align="center">
    <h5 align="center">Number of Retiring Employees per Title</h5>
</p>
Based on the Unique Titles table, the COUNT() function was used get the number of titles. The data was then grouped by the titles to form the Retiring Titles table. This will help give the company an overview of the number of positions that need to be filled in the near future.

*Output File:* [retiring_titles.csv](https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Data/retiring_titles.csv)

- **Mentorship Eligibility**
<p align="center">
    <img src="https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Additional%20Resources/mentorship_eligibility.png" width="550" height="175" align="center">
    <h5 align="center">Number of Retiring Employees per Title</h5>
</p>
For the Mentorship Eligibility, the tables for Employees, Department Employee, and Titles were joined. Data was filtered to all the current employees (to_date of 1/1/9999) and those who were born in the year 1965. The purpose of creating this table is to help the company prepare employees for more senior or leadership roles, taking on the positions that will soon be vacated. This will also make way for new employees that will be hired.

*Output File:* [mentorship_eligibility.csv](https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Data/mentorship_eligibility.csv)

## Summary 
The upcoming "silver tsunami" in Pewlett Hackard will require a lot of strategic planning. To see how this will affect the whole organization will help the company smoothly transition employees to different roles.

- The Retiring Titles table shows that there is a huge amount of employees that will soon retire. Below is the output of a query that may help give additional information. This provides the number of roles specific to each department that will need to be filled in the coming years. It is important to note that these numbers are reflecting only the active employees unlike the Retiring Titles table.

    *Output file:* [unique_dept_titles.csv](https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Data/Additional%20-%20unique_dept_titles.csv)
<p align="center">
    <img src="https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Additional%20Resources/unique_dept_titles.png" width="400" height="180" align="center">
    <h5 align="center">Number of Retiring Employees per Department and Title</h5>
</p>

- As the silver tsunami approaches, the company should be able to evaluate if there are enough qualified, retirement-ready employees to mentor the next generation of Pewlett Hackard employees. Assuming that the employees with titles "Senior Engineer", "Manager", "Senior Staff", and "Technique Leader" are qualified as mentors, the output below may be of aid to the company's planning for the mentorship program. Two separate tables were created, one with the count of retiring employees, and one with those who are not yet going to retire. These tables were then joined to be able to compare the number of retiring versus non-retiring employees per department and title. 

    *Output files:*
    - [retiring_higher_titles.csv](https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Data/Additional%20-%20retiring_higher_titles.csv)
    - [non_retiring_higher_titles.csv](https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Data/Additional%20-%20non_retiring_higher_titles.csv)
    - [retiring_higher_titles_vs_nr.csv](https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Data/Additional%20-%20retiring_higher_titles_vs_nr.csv)
<p align="center">
    <img src="https://github.com/samanthajpv/Pewlett-Hackard-Analysis/blob/9990b6072e92cb860fd6512603ac34a5752ceda0/Additional%20Resources/retiring_vs_nonretiring.png" width="500" height="200" align="center">
    <h5 align="center">Higher Position Count Comparison Between Retiring and Non-Retiring Employees</h5>
</p>

## Reference
(1) Trilogy Education Services. (2021, July). *Module 7 Challenge*. https://courses.bootcampspot.com/courses/626/assignments/13395?module_item_id=212712
