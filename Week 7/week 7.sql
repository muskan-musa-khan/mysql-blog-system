-- Question 1: How many books are in the genre category with the ID of 9?
SELECT COUNT(*)
FROM book b
JOIN bookgenre bg
ON b.ISBN = bg.ISBN
WHERE genreID = 9;

-- Question 1a: List these book titles in descending title alphabetical order
-- Question 1b: What is the genre with this ID?
SELECT genre, b.title
FROM book b
JOIN bookgenre bg
ON b.ISBN = bg.ISBN
JOIN genre g
ON bg.genreID = g.genreID
WHERE g.genreID = 9
ORDER BY b.title DESC;

-- Question 2: List the titles, the first and last names of the library users,
-- the loanstart and the genre for genreID 7
SELECT fname AS "First Name",
       lname AS "Last Name",
       title AS "Book Loaned",
       genre AS "Book Genre",
       g.genreID AS "Genre ID",
       loanstart AS "Loan Start"
FROM libuser u
JOIN loan l
ON u.libraryNumber = l.loanLibraryNumb
JOIN book b
ON b.ISBN = l.ISBN
JOIN bookgenre bg
ON bg.ISBN = b.ISBN
JOIN genre g
ON g.genreID = bg.genreID
WHERE g.genreID = 7;

-- Question 3: Rewrite question 2 with the library user’s name in a single column
-- headed "Library User"
SELECT CONCAT(fname,' ',lname) AS "Library User",
       title AS "Book Loaned",
       genre AS "Book Genre",
       g.genreID AS "Genre ID",
       loanstart AS "Loan Start"
FROM libuser u
JOIN loan l
ON u.libraryNumber = l.loanLibraryNumb
JOIN book b
ON b.ISBN = l.ISBN
JOIN bookgenre bg
ON bg.ISBN = b.ISBN
JOIN genre g
ON g.genreID = bg.genreID
WHERE g.genreID = 7;

-- Question 4: What date did the library user with the last name Khrishtafovich
-- take out the book titled "diverse tertiary knowledge user"?
SELECT CONCAT(fname,' ',lname) AS "Library User",
       loanStart
FROM libuser u
JOIN loan l
ON u.libraryNumber = l.loanLibraryNumb
JOIN book b
ON b.ISBN = l.ISBN
WHERE u.lName = 'Khrishtafovich'
AND b.title = 'diverse tertiary knowledge user';

-- Question 5: List the titles of the books that are second editions
-- Question 5a: Who wrote these books?
SELECT b.title,
       authorFName,
       authorLName
FROM book b
JOIN wrote w
ON b.ISBN = w.wroteISBN
JOIN author a
ON w.authorID = a.authorID
WHERE edition = 'Second';

-- Question 6: List the authors of the Mystery books
SELECT authorFName,
       authorLName
FROM book b
JOIN wrote w
ON b.ISBN = w.wroteISBN
JOIN author a
ON w.authorID = a.authorID
JOIN bookgenre bg
ON bg.ISBN = b.ISBN
JOIN genre g
ON g.genreID = bg.genreID
WHERE g.genre = 'Mystery';

-- Question 7: List the loanstart and the titles for Second edition books
-- Question 7a: Order the result by ISBN in descending order
SELECT b.ISBN,
       b.title,
       loanStart,
       edition
FROM loan l
JOIN book b
ON b.ISBN = l.ISBN
JOIN wrote w
ON b.ISBN = w.wroteISBN
JOIN author a
ON w.authorID = a.authorID
WHERE edition = 'Second'
ORDER BY b.ISBN DESC;

-- Question 8: List the titles of the books written by Lionel Aarons
SELECT b.title
FROM book b
JOIN wrote w
ON b.ISBN = w.wroteISBN
JOIN author a
ON w.authorID = a.authorID
WHERE authorFName = 'Lionel'
AND authorLName = 'Aarons';

-- Question 9: List the books by Justina Lincey and Misty Manueli
SELECT *
FROM book b
JOIN wrote w
ON b.ISBN = w.wroteISBN
JOIN author a
ON w.authorID = a.authorID
WHERE authorFName = 'Justina' AND authorLName = 'Lincey'
OR authorFName = 'Misty' AND authorLName = 'Manueli';

-- Question 9a: Identify the book title they wrote together
SELECT title
FROM book b
JOIN wrote w
ON b.ISBN = w.wroteISBN
JOIN author a
ON w.authorID = a.authorID
WHERE
(authorFName = 'Justina' AND authorLName = 'Lincey')
OR
(authorFName = 'Misty' AND authorLName = 'Manueli')
GROUP BY b.title
HAVING COUNT(w.authorID) = 2;

-- Question 10: List the genres of books taken out of the library
-- between 2020-03-15 and 2020-06-30
SELECT genre AS Genre
FROM book b
JOIN loan l
ON l.ISBN = b.ISBN
JOIN bookgenre bg
ON bg.ISBN = b.ISBN
JOIN genre g
ON g.genreID = bg.genreID
WHERE loanStart BETWEEN '2020-03-15' AND '2020-06-30';
