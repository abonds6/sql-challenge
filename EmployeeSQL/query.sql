select count(*)from employees;
select count(*) from departments;
select count(*) from dept_emp ;
select count(*) from dept_manager ;
select count(*) from titles ;
select count(*) from salaries ;


--Data Analysis

-- 1) List the following details of each employee: employee number, last name, first name, gender, and salary.

select e.emp_no as "Employee Number",
e.last_name as "Last Name",
e.first_name as "First Name",
e.gender as "Gender",
s.salary as "Employee Salary"
from employees e
inner join salaries s on e.emp_no = s.emp_no;

-- 2) List employees who were hired in 1986.

select e.emp_no as "Employee Number",
e.last_name as "Last Name",
e.first_name as "First Name",
e.hire_date	 as "Gender"

from employees e
where e.hire_date > '1985-12-31' ;


-- 3) List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

select 
dm.dept_no as "Department Number",
dp.dept_name as "Department Name",
e.emp_no as "Manager Employee Number",
e.last_name as "Last Name",
e.first_name as "First Name", 
dm.from_date as "Start Date",
dm.to_date as "End Employment Date"


from employees e 
right join dept_manager dm on e.emp_no = dm.emp_no
inner join departments dp on dm.dept_no = dp.dept_no ;

-- 4) List the department of each employee with the following information: employee number, last name, first name, and department name.

select 
e.emp_no as "Employee Number",
dp.dept_name as "Department Name",
e.last_name as "Last Name",
e.first_name as "First Name"

from employees e 
inner join dept_emp de on e.emp_no = de.emp_no
inner join departments dp on de.dept_no = dp.dept_no ;

-- 5) List all employees whose first name is "Hercules" and last names begin with "B."
select 
e.emp_no as "Employee Number",
e.last_name as "Last Name",
e.first_name as "First Name"

from employees e 
where e.first_name = 'Hercules' 
and e.last_name like 'B%' ;


-- 6) List all employees in the Sales department, including their employee number, last name, first name, and department name.

select 
e.emp_no as "Employee Number",
e.last_name as "Last Name",
e.first_name as "First Name",
dp.dept_name as "Department Name"

from employees e 
inner join dept_emp de on de.emp_no = e.emp_no 
inner join departments as dp on de.dept_no = dp.dept_no
where dp.dept_name = 'Sales' ;


-- 7) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select 
e.emp_no as "Employee Number",
e.last_name as "Last Name",
e.first_name as "First Name",
dp.dept_name as "Department Name"

from employees e 
inner join dept_emp de on de.emp_no = e.emp_no 
inner join departments as dp on de.dept_no = dp.dept_no
where dp.dept_name in ('Sales','Development') ;


-- 8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select 
count(e.last_name) as "Count of employee name",
e.last_name as "Last Name"
 
from employees e 
group by e.last_name 
order by count(e.last_name)  desc ;