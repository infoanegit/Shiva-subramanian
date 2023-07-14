/* 1. Display/find the given authors complete address information. [Panteley Sylvia] */
SELECT CONCAT_WS (', ', address, city, state) AS 'complete address' WHERE au_fname = 'Panteley' AND au_lname = 'Sylvia';

/* 2. Display only the hire date and employee name for each employee. */
SELECT hire_date, CONCAT_WS(' ', fname, lname) AS 'employee name' FROM employee;

/* 3. Display all the books which come under ‘Psychology’ type. */
SELECT * FROM titles WHERE type = 'Psychology';