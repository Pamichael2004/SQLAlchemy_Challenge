-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/fqFWCA
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "dept_no" INT   NOT NULL,
    "dept_name" VARCHAR(200)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Department_Employee" (
    "employee_no" INT   NOT NULL,
    "dept_no" INT   NOT NULL,
    CONSTRAINT "pk_Department_Employee" PRIMARY KEY (
        "employee_no"
     )
);

CREATE TABLE "Department_Manager" (
    "dept_no" INT   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_Department_Manager" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "emp_title" INT   NOT NULL,
    "birth_date" INT   NOT NULL,
    "first_name" VARCHAR(200)   NOT NULL,
    "last_name" VARCHAR(200)   NOT NULL,
    "sex" VARCHAR(200)   NOT NULL,
    "hire_date" INT   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "employ_no" INT   NOT NULL,
    "salaries" INT   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "employ_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" INT   NOT NULL,
    "title" VARCHAR(200)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

