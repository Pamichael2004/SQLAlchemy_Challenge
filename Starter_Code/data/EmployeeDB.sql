SELECT * FROM departments LIMIT 10;
SELECT * FROM dept_employees LIMIT 332000;
SELECT * FROM dept_manager LIMIT 30;
SELECT * FROM employees LIMIT 332000;
SELECT * FROM salaries LIMIT 400000;
SELECT * FROM titles LIMIT 10;

1.List the employee number, last name, first name, sex, and salary of each employee.
-- Create a table of employees

SELECT emp.emp_no as employee_number, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees as emp
LEFT JOIN salaries as sal
ON emp.emp_no = sal.emp_no
ORDER BY emp.emp_no;

2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986';

3. List the manager of each department along with their department number, department name, employee number, last name, and first name.



4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT dept_employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_employees
JOIN employees
ON dept_employees.emp_no = employees.emp_no
JOIN departments
ON dept_employees.dept_no = departments.dept_no;



5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT dept_employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_employees
JOIN employees
ON dept_employees.emp_no = employees.emp_no
JOIN departments
ON dept_employees.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';


7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT dept_employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_employees
JOIN employees
ON dept_employees.emp_no = employees.emp_no
JOIN departments
ON dept_employees.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;