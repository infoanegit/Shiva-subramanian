/* 1. How many stores are in each unique state in the stores table? Select the state and
   display the number of store  in each. Hint: count is used to count rows in a column,
   sum works on numeric data only. */
   SELECT state, COUNT(stores.stor_name) AS 'number of store' FROM stores GROUP BY state;

/* 2. Select the title and price in the table title that the price is
   greater than 10.00. Display the results in Ascending order based on the price */
   SELECT * from titles;
   SELECT title, price FROM titles WHERE price > 10 ORDER BY price ASC;