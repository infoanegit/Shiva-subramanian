/* 1. Display/find the given authors complete address information. [Panteley Sylvia] */
SELECT CONCAT_WS (', ', address, city, state, zip) AS 'complete address' FROM authors WHERE au_lname = 'Panteley' AND au_fname = 'Sylvia';

/* 2. Display only the hire date and employee name for each employee. */
SELECT hire_date, CONCAT_WS(' ', fname, lname) AS 'employee name' FROM employee;

/* 3. Display all the books which come under ‘Psychology’ type. */
SELECT * FROM titles WHERE type = 'Psychology';