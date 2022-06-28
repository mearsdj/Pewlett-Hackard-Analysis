--Employee_Database_Challenge
--create table of retirement titles
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO Retirement_Titles
FROM employees e
	INNER JOIN titles t
	ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
-- create table of unique titles
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;

-- PH-EmployeeDB=# \COPY unique_titles TO 'c:\users\derek\documents\bootcamp\module 7\Pewlett-Hackard-Analysis\Data\uniq
-- ue_titles.csv' with csv header
-- COPY 72458

--query to retreive # of employees about to retire, by job title

-- first table of unique titles for employees about to retire
-- creating table of unique titles
SELECT COUNT (ut.emp_no) as "Employee_Count", ut.title
INTO retiring_titles
FROM unique_titles ut
GROUP BY ut.title
ORDER BY "Employee_Count" desc;


-- PH-EmployeeDB=# \COPY  retiring_titles TO 'c:\users\derek\documents\bootcamp\module 7\Pewlett-Hackard-Analysis\Data\r
-- etiring_titles.csv' with csv header
-- COPY 7



--write a query to create a Mentorship Eligibility table that holds the employees who are eligible
--to participate in a mentorship program.

--DROP TABLE IF EXISTS mentorship_eligibility
--CASCADE;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees e
INNER JOIN dept_emp de
ON (e.emp_no = de.emp_no)
INNER JOIN titles t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
and (de.to_date='9999-01-01')
ORDER BY e.emp_no;

select count(*) from mentorship_eligibility;

--create 
SELECT COUNT (me2.emp_no) as "Employee_Count", me2.title
--INTO retiring_titles
FROM mentorship_eligibility2 me2
GROUP BY me2.title
ORDER BY "Employee_Count" desc;
