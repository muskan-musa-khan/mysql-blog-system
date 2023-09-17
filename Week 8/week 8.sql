-- Question 1
SELECT title, loanStart
FROM loan l
JOIN book b ON l.ISBN = b.ISBN
WHERE b.title ='PROFIT-FOCUSED BANDWIDTH-MONITORED UTILISATION';

-- Question 2
SELECT title AS Title,
       loanStart AS "Loan DATE",
       concat(authorFName," ",authorLName) AS Author
FROM loan l
JOIN book b ON l.ISBN = b.ISBN
JOIN wrote w
ON wroteISBN = b.ISBN
JOIN author a
ON a.authorID = w.authorID 
WHERE authorFName ='Aaren'
AND authorLName = 'Larret';

-- Question 3
SELECT title AS Title,
       loanStart,
       concat(authorFName," ",authorLName) AS Author
FROM loan l
RIGHT JOIN book b ON l.ISBN = b.ISBN
JOIN wrote w
ON wroteISBN = b.ISBN
JOIN author a
ON a.authorID = w.authorID 
WHERE authorFName ='Aaren'
AND authorLName = 'Larret'
AND l.isbn IS NULL;

-- Question 4
SELECT count(*)
FROM book;

-- Question 5
SELECT COUNT(DISTINCT l.isbn)
FROM book b
JOIN loan l
ON l.isbn = b.isbn;

-- Question 6
SELECT COUNT(b.ISBN)
FROM book b
LEFT JOIN loan l
ON l.isbn = b.isbn
WHERE l.loanStart IS NULL;

-- Question 7
SELECT authorFName,
       authorLName,
       title,
       loanStart
FROM loan l
JOIN book b ON l.ISBN = b.ISBN
JOIN wrote w
ON wroteISBN = b.ISBN
JOIN author a
ON a.authorID = w.authorID
WHERE loanStart BETWEEN '2020-05-01' AND '2020-05-30'
ORDER BY authorLName ASC;

-- Question 8
SELECT authorFName,
       authorLName,
       title,
       loanStart
FROM loan l
JOIN book b ON l.ISBN = b.ISBN
JOIN wrote w
ON wroteISBN = b.ISBN
JOIN author a
ON a.authorID = w.authorID
WHERE loanStart BETWEEN '2020-05-01' AND '2020-05-30'
ORDER BY authorLName ASC, loanStart ASC;

-- Question 9
SELECT b.title, genre
FROM book b
LEFT JOIN bookgenre bg
ON b.ISBN = bg.ISBN
LEFT JOIN genre g
ON g.genreID = bg.genreID
WHERE g.genre IS NULL;

-- Question 10
SELECT count(*)
FROM book b
LEFT JOIN bookgenre bg
ON b.ISBN = bg.ISBN
LEFT JOIN genre g
ON g.genreID = bg.genreID
WHERE g.genre IS NULL;
