--employee_table_schemata.sql
-- Drop Tables if Existing
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;


--Create Employees, Titles, Departments, Department Employees, Department Managers and Salaries tables
create table employees (
	emp_no INT PRIMARY KEY not null,
	birth_date date DEFAULT ('now'::text)::date NOT NULL,
	first_name character varying(45) NOT NULL,
        last_name character varying(45) NOT NULL,
	gender varchar (1) not null,
	hire_date date DEFAULT ('now'::text)::date NOT NULL
);


create table titles (
	emp_no INT REFERENCES employees(emp_no),
	title varchar(45) not null,
	from_date date DEFAULT ('now'::text)::date NOT NULL,
	to_date date DEFAULT ('now'::text)::date NOT NULL
);
	

create table departments (
	dept_no varchar(4) PRIMARY KEY not null,
	dept_name varchar (45) not null
);
	

create table dept_emp (
	emp_no INT REFERENCES employees(emp_no),
	dept_no varchar(4)  REFERENCES departments(dept_no),
	from_date date DEFAULT ('now'::text)::date NOT NULL,
	to_date date DEFAULT ('now'::text)::date NOT NULL
);


create table dept_manager (
	dept_no varchar(4)  REFERENCES departments(dept_no),
	emp_no INT REFERENCES employees(emp_no),
	from_date date DEFAULT ('now'::text)::date NOT NULL,
	to_date date DEFAULT ('now'::text)::date NOT NULL
);

create table salaries (
	emp_no INT REFERENCES employees(emp_no),
	salary INT not null,	
	from_date date DEFAULT ('now'::text)::date NOT NULL,
	to_date date DEFAULT ('now'::text)::date NOT NULL
);