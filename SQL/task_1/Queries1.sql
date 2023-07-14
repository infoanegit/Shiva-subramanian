/* 1.Write an SQL Query to display all information in the authors table. */
SELECT * FROM authors;

/* 2.Display all authors first name and last name who lived in the state ‘UT’. */
SELECT au_fname AS 'first name', au_lname AS 'last name' FROM authors;

/* 3.Display the last names of all authors with an `A' in their last name. */
SELECT CONCAT_WS(' ', au_fname, au_lname) AS name FROM authors WHERE au_lname LIKE '%A%' ;

/* 4.Display all information of an author with phone number is ‘707 448-4982'. */
SELECT * FROM authors WHERE phone = '707 448-4982';