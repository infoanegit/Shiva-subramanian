/* 1.Display the names and hire dates of  employees hired between 1991 - 1992. */
SELECT fname, lname, hire_date FROM employee WHERE YEAR(hire_date) BETWEEN 1991 AND 1992;

/* 2.Display the names of employees without middle (minit) name. */
SELECT REPLACE(CONCAT_WS(' ', fname, lname), minit, '') AS 'Name without minit' FROM employee;

/* 3.Display the names and hire dates of all employees with the column headers \Name" and \Start Date", in the order they were hired. */
SELECT fname, lname, hire_date FROM employee ORDER BY hire_date;

/* 4.Retrieve the names of  employees whose designation is ‘Sales Representative’. */
SELECT employee.fname, employee.lname, jobs.job_desc AS Designation FROM employee LEFT JOIN jobs ON employee.job_id = jobs.job_id WHERE jobs.job_desc = 'Sales Representative';