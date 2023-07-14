/* 1. Select the average price in the table titles for  pub_id 1389. */
SELECT AVG(price) FROM titles WHERE pub_id = '1389';

/* 2. What are the total numbers of rows in the titles table */
SELECT COUNT(*) AS 'total numbers of rows' FROM titles;

/* 3. List the address of all stores  in the state WA or CA in the table stores */
SELECT stor_name FROM stores WHERE state IN ('WA', 'CA');

/* 4. List the date between  the year 1989 to 1992 in the table employee */
SELECT hire_date FROM employee WHERE YEAR(hire_date) BETWEEN 1989 AND 1992;

/* 5. List the first name and last name of the employee in the employee table where the jobs_id  is 6 */
SELECT fname, lname FROM employee WHERE job_id = 6;