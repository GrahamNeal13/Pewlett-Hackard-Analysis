-- Use Dictinct with Orderby to remove duplicate rows
--SELECT DISTINCT ON (______) _____,
--______,
--______,
--______
--INTO nameyourtable
--FROM _______
--WHERE _______
--ORDER BY _____, _____ DESC;

--Create retirement_titles table
SELECT e.emp_no, 
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
into retirement_titles
from employees as e
FULL OUTER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
ti.title
INTO unique_titles
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (to_date = '9999-01-01')
ORDER BY e.emp_no, ti.to_date DESC;

--Create retiring_titles table
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY count DESC;

--Create mentorship_eligibilty table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp AS de
ON de.emp_no = e.emp_no
INNER JOIN titles as ti
on e.emp_no = ti.emp_no
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

