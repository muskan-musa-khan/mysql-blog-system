-- Question1: What book titles have been read by user number DDE48080622?
SELECT u.libraryNumber, b.title
FROM libuser u
JOIN loan l ON u.libraryNumber = l.loanLibraryNumb
JOIN book b ON b.isbn = l.isbn
WHERE u.libraryNumber = 'DDE48080622';

-- Question 2 What are the names of the library users who have read action books in Gosport
SELECT fName, mName, lName
FROM libuser u
JOIN loan l 
ON u.libraryNumber = l.loanLibraryNumb
JOIN book b 
ON l.ISBN = b.ISBN
JOIN bookgenre bg
ON b.ISBN = bg.ISBN 
JOIN genre g
ON g.genreId = bg.genreId
WHERE genre = 'Action' AND town = 'Gosport';

-- Question 3 How many books has the author Katherine Maxweell written?
SELECT COUNT(*) AS totalBooks
FROM book b
JOIN wrote w
ON b.ISBN = w.wroteISBN
JOIN author a
ON a.authorId = w.authorID
WHERE authorFName ='Katrine' AND authorLName ='Maxweell';

-- Question 4: What edition of CUSTOMER-FOCUSED IMPACTFUL ENCODING does the library
-- have on stock?
SELECT edition
FROM book
WHERE title = 'CUSTOMER-FOCUSED IMPACTFUL ENCODING';

-- Question 5: What is the genre of VERSATILE ZERO TOLERANCE MODERATOR?
SELECT genre
FROM book b
JOIN bookgenre bg
ON b.ISBN = bg.ISBN
JOIN genre g 
ON g.genreID = bg.genreID
WHERE b.title ='VERSATILE ZERO TOLERANCE MODERATOR';

-- Question 6: Who wrote VERSATILE ZERO TOLERANCE MODERATOR?
SELECT authorFName, authorLName, title
FROM author a
JOIN wrote w
ON a.authorID = w.authorID
JOIN book b
ON b.ISBN = w.wroteISBN
WHERE b.title ='VERSATILE ZERO TOLERANCE MODERATOR';

-- Question 7: What type of books does Lolita Mityukov write?
SELECT genre
FROM author a
JOIN wrote w
ON a.authorID = w.authorID
JOIN book b
ON b.ISBN = w.wroteISBN
JOIN bookgenre bg
ON bg.ISBN = b.ISBN 
JOIN genre g
ON bg.genreID = g.genreID
WHERE authorFName = 'Lolita' AND authorLName ='Mityukov';

-- Question 8: What are the genres that the library user Mikel Matyas read?
SELECT fName, lName, genre
FROM libuser u
JOIN loan l 
ON u.libraryNumber = l.loanLibraryNumb
JOIN book b
ON b.ISBN = l.ISBN
JOIN bookgenre bg
ON b.ISBN = bg.ISBN
JOIN genre g
ON bg.genreID = g.genreID
WHERE fName = 'Mikel' AND lName = 'Matyas';

-- Question 9: Who wrote the book with the ISBN of 796212789-9? 
SELECT authorFName, authorLName
FROM author a
JOIN wrote w
ON a.authorID = w.authorID
JOIN book b
ON b.ISBN = w.wroteISBN
WHERE b.ISBN = '796212789-9';

-- Question 10: Who wrote the book AMELIORATED MOTIVATING LEVERAGE and what is the genre?
SELECT a.authorFName, a.authorLName, g.genre
FROM author a
JOIN wrote w
ON a.authorID = w.authorID
JOIN book b
ON b.ISBN = w.wroteISBN
JOIN bookgenre bg
ON b.ISBN = bg.ISBN
JOIN genre g 
ON bg.genreID = g.genreID
WHERE b.title ='AMELIORATED MOTIVATING LEVERAGE';

-- Question 11: Which library user took the book USER-FRIENDLY INTERACTIVE CAPACITY out on
-- 2020-01-04 and what was the genre?
SELECT u.fName, u.mName, u.lName, g.genre
FROM libuser u 
JOIN loan l
ON u.libraryNumber = l.loanLibraryNumb
JOIN book b 
ON b.ISBN = l.ISBN
JOIN bookgenre bg
ON bg.ISBN = b.ISBN 
JOIN genre g 
ON bg.genreID = g.genreID
WHERE b.title = 'USER-FRIENDLY INTERACTIVE CAPACITY'
AND l.loanStart = '2020-01-04';

-- Question:12 . What date did Bay Bearcock take the book by Nelie Cheesworth out of the library?
-- a. What was the date?
-- b. What is the genre?
SELECT l.loanStart, genre
FROM libuser u 
JOIN loan l 
ON u.libraryNumber = l.loanLibraryNumb
JOIN book b 
ON b.ISBN = l.ISBN
JOIN wrote w 
ON b.ISBN = w.wroteISBN
JOIN bookgenre bg
ON bg.ISBN = b.ISBN
JOIN genre g 
ON g.genreid = bg.genreid
JOIN author a 
ON w.authorID = a.authorID
WHERE u.fName = 'Bay'
AND u.lName = 'Bearcock'
AND a.authorFName = 'Nelie'
AND a.authorLName = 'Cheesworth';
