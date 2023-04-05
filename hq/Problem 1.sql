-- Run the create_rare_books.sql script found under Database
-- Scripts in Canvas then answer each of the questions below.
-- Each question is worth 10 points.

use rarebooks;

-- Problem 1
-- Show the count of books currently in stock for each 
-- condition description (i.e., Poor, Good, Fine, etc.).
-- Hint: For this problem you need to find books that have Volumes that do Not have sales!
-- Expected results

And :: select(book_numb) form book
where condition_decription = "poor","good","fine";

/* condition_description, count
	'New', '10'
	'Excellent', '15'
	'Fine', '3'  */

-- Problem 2
-- Show the total book sales for each condition description and
-- order the result by the highest sales first.

Ans :: select sale,condition_description
from sale order by sale desc, conditon_description;


-- Problem 3
-- Find the inventory count for every book in stock by author name 
-- and book title.  Sort the result by author name then title, both
-- in ascending order.
-- Hint: For this problem you need to find books that have Volumes that do Not have sales!

-- Some of the results (not all)

	/*# author, title, count
 	Asimov, Isaac, Foundation, 8
	Asimov, Isaac, I, Robot, 2
	Asimov, Isaac, Last Foundation, 4
	Barth, John, Lost in the Funhouse, 1
	Barth, John, Sot Weed Factor, The, 1 */

-- Ans :: Select count(author_numb) 
from author
[where = author_last_first = "this"]
[order by author_last_first] [ASC]

Select count(author_numb) 
from author
[where = author_last_first = "this"]
order by author_last_first] [DESC]



-- Problem 4
-- Get the count of books in stock from each publisher.  Show the
-- ISBN, title, publisher name, edition, binding, copyright year,
-- and count of books in stock, ordered by publisher name ascending.
-- Hint: For this problem you need to find books that have Volumes that do Not have sales!

Ans :: Select count(ISBN) from book;
	Select ISBN, title,publisher_name,edition,binding,copyright_year
	from book;

	select count(ISBN) from book
	order by author_last_first;

-- Problem 5
-- Generate a sales report showing the daily sales for all book 
-- sales in the year 2021, with subtotals for month and year.
-- Hint: Here's last rows from the answer, there is more rows returned but hopefully this helps
-- What we want to see is on each day of the year what were the sales
-- To get each column separated you need to parse out the year, month and day our of the date using whatever functions you use.
-- The most challenging in this problem is to think about is how do you group by and rollup correctly to get the answers rolled up by year and month? 
	
    /* year	month	day	sales
	2021	7	10	455.95
	2021	7	12	100.00
	2021	7	25	230.00
	2021	7		1475.95
	2021	8	22	100.00
	2021	8		100.00
	2021	9	1	170.00
	2021	9		170.00
	2021	10	13	510.00
	2021	10		510.00
	2021			2658.95 */

Ans:: --select * from sale_id
	where sale_date like "_%11-2022";

	
	--select count(sale_id) from sale
	where sale_date like "%-2022";

	--select count(sale_id) from sale
	where sale_date like "%-2022";

	
 
-- Problem 6
-- Show the book inventory id, title, condition description and
-- selling price for books that had a selling price higher 
-- than the average selling price of books sold in July, 2021, 
-- sorted by title in ascending order.

Ans :: select ISBN, title, condition_description
	FROM book, work, condition_code;

	select selling_price form volume
	order by selling_price ASC;

	select avg(selling_price)
	from volume
	where sale_date = like "%-2022";

	--select * from work
	order by  title ASC



	
	

-- Problem 7
-- Generate the best seller list for July, 2021
-- Along with author and title, give the number of copies sold
-- and the total sales amount for each book.  Order the
-- result by copies sold in descending order.
-- Hint: You might try writing the query for copies sold first


Ans :: select selling_price from volume
	where sale_date  = LIKE "%-2022"
	order by selling_price 
	limit 1;
	
	-- select author_last_first,title,selling_price from author,work
		order by  author_last_first,title,selling_price ASC;

-- Problem 8
-- Give statements to insert a new sale for customer id 3 of the 
-- volume with inventory_id 67 on 11/3/2021 for $125 with credit 
-- card number 1234 5678 9101 4321, expiration month 7, expiration 
-- year 23.
-- Hint: you need to also insert into sales table and update volume table. 
-- Use LAST_INSERT_ID()!
-- INSERT INTO sale
-- UPDATE volume 

Ans :: update volume 
	set inventory_id = 67, date_acquired = "11/3/2021",asking_price = "$125"
	;

	
	update sale  
	set credit_card_numb  =  "1234 5678 9101 4321",exp_month = 7;

-- Problem 9
-- Add the JK Rowling book "Harry Potter and Sorcerer's Stone"
-- to the rare book inventory.  This first edition book acquired
-- on 3/1/2018 is in excellent condition and has the ISBN 
-- 978-0-78622-272-8, a leather binding, the copyright year 1999 
-- from the publisher Thorndike Press and an asking price of $100.
-- Hint:
-- Following tables needs to have data inserted: author, work, book, publisher, volumne
-- Following tables needs to have data updated: book
	
Ans :: -- UPDATE work
	set title = "Harry Potter and Sorcerer's Stone";

	-- UPDATE book
	set binding = "leather binding" ;

	--UPDATE volume
	set date_acquired = "3/1/2018",asking_price ="$100" ;

	-- UPDATE publisher
	set publisher_name = " Thorndike Press"; 
	

-- Problem 10
-- Delete the publisher Thorndike Press from the Rare Books 
-- inventory.  Make sure to handle the case in which there are 
-- more than one book in inventory from Thorndike PRess
-- Hint: 3 tables needs to have records removed!

Ans ::  -- DELETE from publisher 
		WHERE publisher_name = "Thorndike Press"
	 
	-- SELECT IF(count(title) > 3) title from work;
	





