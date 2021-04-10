--Module 7, Deliverable 1
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
    first_name,
    last_name,
    title

INTO Unique_Titles
FROM retirement_titles AS rt
ORDER BY emp_no ASC, t0_date DESC;


-- Retrieve the numberof employees by their most recent job title
-- who are about to retire.
SELECT COUNT(ut.emp_no),
    ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP By title
ORDER BY COUNT(title) DESC;


-- Module 7, Deliverable 2
-- Write a query to create a Mentorship Eligibility table that holds
-- employees who are eligible to participate in a mentorship program.

--1. Retrieve the emp_no, first_name, last_name, and birth_date colums of the Employees table.
SELECT DISTINCT ON(e.emp_no) e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	ORDER BY e.emp_no;


