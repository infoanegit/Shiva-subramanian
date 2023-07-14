/* 1. Display the maximum and minimum price of the book. */
SELECT title, MAX(price) AS 'maximum price', MIN(price) AS 'minimum price' FROM titles GROUP BY title;

/* 2. Display the total book price for each type. */
SELECT type, sum(price) AS 'price total' FROM titles GROUP BY type;

/*
	Find out the Publisher for the following books 

   �Cooking with Computers: Surreptitious Balance Sheets�, 
   �Silicon Valley Gastronomic Treats�, 
   �Is Anger the Enemy?�, 
   �Fifty Years in Buckingham Palace Kitchens�.
*/
SELECT publishers.pub_name AS Publisher FROM publishers LEFT JOIN titles ON publishers.pub_id = titles.pub_id WHERE titles.title IN ('Cooking with Computers: Surreptitious Balance Sheets', 'Silicon Valley Gastronomic Treats', 'Is Anger the Enemy?', 'Fifty Years in Buckingham Palace Kitchens');