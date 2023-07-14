/* 1. Display/find the total number of Publishers in publishers table. */
SELECT COUNT(*) AS 'Total Number of Publishers' FROM publishers;

/* 2. Display the employee name and job description of all employees with the same job as Howard. */
SELECT employee.fname, employee.lname, jobs.job_desc FROM employee LEFT JOIN jobs ON employee.job_id = jobs.job_id WHERE jobs.job_desc = (SELECT jobs.job_desc FROM employee LEFT JOIN jobs on employee.job_id = jobs.job_id WHERE employee.fname = 'Howard');

/* 3. Display the employee name and job description of all employees whose are not Managing Editor. */
SELECT employee.fname, employee.lname, jobs.job_desc FROM employee LEFT JOIN jobs ON employee.job_id = jobs.job_id WHERE jobs.job_desc != 'Managing Editor';