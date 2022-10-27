-- Deliverable 1: Find the number of retiring employees by title:

-- Retrieve the emp_no, first_name, and last_name columns from the Employees 
-- table.
-- Retrieve the title, from_date, and to_date columns from the Titles table.
-- Create a new table using the INTO clause.
-- Join both tables on the primary key.
-- Filter the data on the birth_date column to retrieve the employees who were 
-- born between 1952 and 1955. Then, order by the employee number.

SELECT emp.emp_no,
	emp.first_name,
	emp.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirees_info
FROM employees AS emp
	INNER JOIN titles as ti
	ON (emp.emp_no = ti.emp_no)
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Check data and get total count of distinct employee numbers 
SELECT * FROM retirees_info LIMIT 10;

-- Export the Retirement Titles table from the previous step as retirement_titles.csv 
-- and save it to your Data folder in the Pewlett-Hackard-Analysis folder.

-- Use Dictinct with Orderby to remove duplicate rows:
-- 		Retrieve the employee number, first and last name, and title columns from 
--		the Retirement Titles table. These columns will be in the new table that 
--      will hold the most recent title of each employee.

-- 		Exclude those employees that have already left the company by filtering on 
-- 		to_date to keep only those dates that are equal to '9999-01-01'.

-- 		Create a Unique Titles table using the INTO clause.

-- 		Sort the Unique Titles table in ascending order by the employee number and
-- 		descending order by the last date (i.e., to_date) of the most recent title.

SELECT DISTINCT ON (emp_no) emp_no , first_name, last_name, title 
	INTO recent_titles_info
	FROM retirees_info
	WHERE (to_date = '9999-01-01')
	ORDER BY emp_no ASC, to_date DESC;

-- Export the Unique Titles table as unique_titles.csv and save it to your Data 
-- folder in the Pewlett-Hackard-Analysis folder.

-- Retrieve the number of employees by their most recent job title who are about to 
-- retire:
-- 		Retrieve the number of titles from the Unique Titles table.
-- 		Then create a Retiring Titles table to hold the required information.
-- 		Group the table by title, then sort the count column in descending order.

SELECT COUNT(emp_no), title
	INTO retiring_titles_info 
	FROM recent_titles_info
	GROUP BY title
	ORDER BY COUNT(title) DESC;

-- Export the Retiring Titles table as retiring_titles.csv and save it to your 
-- Data folder in the Pewlett-Hackard-Analysis folder.

----------------------------------------------------------------------------------

-- Deliverable 2: Create a mentorship-eligibility table that holds the current 
-- employees who were born between January 1, 1965 and December 31, 1965.

-- Retrieve the emp_no, first_name, last_name, and birth_date columns from the 
-- Employees table.
-- Retrieve the from_date and to_date columns from the Department Employee table.
-- Retrieve the title column from the Titles table.
-- Use a DISTINCT ON statement to retrieve the first occurrence of the employee 
-- number for each set of rows defined by the ON () clause.
-- Create a new table using the INTO clause.
-- Join the Employees and the Department Employee tables on the primary key.
-- Join the Employees and the Titles tables on the primary key.
-- Filter the data on the to_date column to all the current employees, then filter 
-- the data on the birth_date columns to get all the employees whose birth dates are 
-- between January 1, 1965 and December 31, 1965.
-- Order the table by the employee number.

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
	d.from_date, d.to_date,
	ti.title
INTO membership_eligibility_info
FROM employees as e
INNER JOIN dept_emp AS d ON (e.emp_no = d.emp_no)
INNER JOIN titles AS ti ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (d.to_date = '9999-01-01')
ORDER BY emp_no;

-- Check data 
SELECT * FROM membership_eligibility_info LIMIT 10;

-- Additional query for distribution of mentorship-eligible employees by title
SELECT COUNT(emp_no), title 
	FROM membership_eligibility_info
	GROUP BY title
	ORDER BY COUNT(title) DESC;

-- Export the Mentorship Eligibility table as mentorship_eligibilty.csv and save it 
-- to your Data folder in the Pewlett-Hackard-Analysis folder.