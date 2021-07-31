-- Deliverable 1

-- create retirement_titles table (join employees and titles)
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
    first_name,
    last_name,
    title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

-- create retiring_titles table (count of retiring titles)
SELECT COUNT (title) AS 'count', title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY 'count' DESC;


-- Deliverable 2

-- create mentorship_eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO mentorship_eligibility
FROM employees AS e
JOIN dept_emp as de ON (e.emp_no = de.emp_no)
JOIN titles AS t ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') AND
    (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;


-- Additional Queries (for Summary)

-- create unique titles table with department name
SELECT d.dept_name, ut.title, COUNT(ut.emp_no) AS "count"
INTO unique_dept_titles
FROM unique_titles AS ut
JOIN dept_emp AS de ON de.emp_no = ut.emp_no
JOIN departments AS d ON d.dept_no = de.dept_no
WHERE to_date = '9999-01-01'
GROUP BY d.dept_name, ut.title
ORDER BY d.dept_name, ut.title;

-- get distinct titles
SELECT DISTINCT title FROM titles;

-- retiting employees with higher positions 
SELECT DISTINCT d.dept_name, t.title, COUNT(de.emp_no) AS "count"
INTO retiring_higher_titles
FROM dept_emp AS de
JOIN titles AS t ON t.emp_no = de.emp_no
JOIN departments AS d ON d.dept_no = de.dept_no 
JOIN employees AS e ON e.emp_no = de.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND
	(t.to_date = '9999-01-01') AND 
	(t.title in ('Senior Engineer', 'Manager', 'Senior Staff', 'Technique Leader'))
GROUP BY d.dept_name, t.title
ORDER BY d.dept_name, t.title;

-- non-retiting employees with higher positions 
SELECT DISTINCT d.dept_name, t.title, COUNT(de.emp_no) AS "count"
INTO non_retiring_higher_titles
FROM dept_emp AS de
JOIN titles AS t ON t.emp_no = de.emp_no
JOIN departments AS d ON d.dept_no = de.dept_no 
JOIN employees AS e ON e.emp_no = de.emp_no
WHERE (e.birth_date >= '1956-01-01') AND
	(t.to_date = '9999-01-01') AND 
	(t.title in ('Senior Engineer', 'Manager', 'Senior Staff', 'Technique Leader'))
GROUP BY d.dept_name, t.title
ORDER BY d.dept_name, t.title;

-- join higher title tables for comparison
SELECT rht.dept_name, rht.title, rht.count AS "Retiring Count", 
	COALESCE(nrht.count,0) AS "Non-Retiring Count"
INTO retiring_higher_titles_vs_nr
FROM retiring_higher_titles AS rht
LEFT JOIN non_retiring_higher_titles AS nrht ON
	nrht.dept_name = rht.dept_name AND
	nrht.title = rht.title
ORDER BY rht.dept_name, rht.title;