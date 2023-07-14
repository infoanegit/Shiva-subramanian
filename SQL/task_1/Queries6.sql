/* 1. Find the total number of books in ‘Business’ type. */
SELECT COUNT(*) AS 'total number of books' FROM titles WHERE type = 'Business';

/* 2. Display the published date for this book ‘Life Without Fear’. */
SELECT pubdate AS 'published date' FROM titles WHERE title = 'Life Without Fear';

/* 3. Display all the books title published by ‘Binnet & Hardley’. */
SELECT titles.title FROM titles LEFT JOIN publishers ON publishers.pub_id = titles.pub_id WHERE pub_name = 'Binnet & Hardley';

/* 4. Find the authors first name and last name for this book ‘Straight Talk About Computers’. */
SELECT authors.au_fname, authors.au_lname FROM authors LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id LEFT JOIN titles ON titles.title_id = titleauthor.title_id WHERE titles.title = 'Straight Talk About Computers';