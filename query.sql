-- 1. List the employee number, last name, first name, sex, and 
-- salary of each employee.

SELECT 
	e.emp_no
	,e.first_name
	,e.last_name
	,e.sex
	,s.salary
FROM employees AS e 
INNER JOIN salaries AS s ON 
s.emp_no = e.emp_no 

--2
--  List the first name, last name, 
-- and hire date for the employees who were hired in 1986.
SELECT 
	first_name
	,last_name
	,hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--3
--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.
SELECT 
	dm.emp_no
	,dm.dept_no
	,e.first_name
	,e.last_name
	,d.dept_name
FROM dept_manager AS dm
INNER JOIN employees AS e ON 
e.emp_no=dm.emp_no
INNER JOIN department AS d ON 
d.dept_no=dm.dept_no

--4
-- List the department number for each employee along with that employee’s employee number,
-- last name, first name, and department name.
SELECT 
	de.emp_no
	,de.dept_no
	,e.first_name
	,e.last_name
	,d.dept_name
FROM dept_emp AS de
INNER JOIN employees AS e ON 
e.emp_no=de.emp_no
INNER JOIN department AS d ON 
d.dept_no=de.dept_no
ORDER BY d.dept_name

--5
-- List first name, last name, and sex of each employee whose first name is Hercules
-- and whose last name begins with the letter B.
SELECT 
	first_name
	,last_name
	,sex
FROM employees 
WHERE 
	first_name='Hercules' 
	AND last_name LIKE 'B%'

--6
-- List each employee in the Sales department, 
-- including their employee number, last name, and first name.

SELECT 
	e.first_name
	,e.last_name
	,e.emp_no
FROM employees AS e 
INNER JOIN dept_emp AS de ON
e.emp_no=de.emp_no 
INNER JOIN department AS d ON 
d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales'

--7
-- List each employee in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
SELECT 
	e.first_name
	,e.last_name
	,e.emp_no
	,d.dept_name
FROM employees AS e 
INNER JOIN dept_emp AS de ON
e.emp_no=de.emp_no 
INNER JOIN department AS d ON 
d.dept_no=de.dept_no
WHERE d.dept_name IN ('Sales', 'Development')

--8
-- List the frequency counts, in descending order, 
-- of all the employee last names (that is, how many employees share each last name).
SELECT 
	count(last_name) AS name_count
	,last_name 
FROM 
	employees
GROUP BY 
	last_name
Order BY 1 DESC