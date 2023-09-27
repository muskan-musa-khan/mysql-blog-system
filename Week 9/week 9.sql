-- Question1 
SELECT loanStart AS "Loaned out", libraryNumber, title
FROM libuser u 
RIGHT JOIN loan l 
ON u.libraryNumber = l.loanLibraryNumb
JOIN book b
ON b.isbn = l.ISBN
WHERE fName='Carmelle' AND lName ='Nuton';

-- Question 2
SELECT concat(fName,mName,lName) AS UserName
FROM libuser u 
LEFT JOIN loan l 
ON u.libraryNumber = l.loanLibraryNumb
WHERE l.loanStart IS NULL;

-- Question 3
SELECT genre
FROM book b 
JOIN wrote w
ON wroteISBN = b.ISBN
JOIN author a
ON a.authorID = w.authorID
JOIN bookgenre bg
ON bg.ISBN = b.ISBN
JOIN genre g 
ON g.genreID = bg.genreID 
WHERE authorFName = 'Meaghan'
AND authorLName = 'Beswell';

-- Question 4
SELECT l.ISBN, libraryNumber, title, loanStart
FROM libuser u 
JOIN loan l 
ON u.libraryNumber = l.loanLibraryNumb
JOIN book b
ON b.isbn = l.ISBN
WHERE (fName='Ag' AND lName ='Roncelli')
AND loanStart IS NOT NULL;
-- There is no book with loan date 20th November so I chose to find all loan dates

-- Question 5
SELECT authorFName, authorLName
FROM wrote w 
JOIN author a
ON a.authorID = w.authorID
JOIN book b
ON b.isbn = w.wroteisbn
WHERE b.title = 'Adaptive 4th Generation Model';

-- Question 6
SELECT loanStart, title
FROM loan l 
JOIN book b
ON l.ISBN = b.ISBN
WHERE b.title = 'Adaptive 4th Generation Model';

-- Question 7 
SELECT concat(fname," ",mName," ",lName) AS Customer,
       concat(authorFName," ",authorLName) AS Author,
       loanstart AS "Loan Start"
FROM libuser u 
JOIN loan l 
ON u.libraryNumber = l.loanLibraryNumb
JOIN book b
ON l.ISBN = b.ISBN
JOIN wrote w 
ON b.ISBN = w.wroteISBN
JOIN author a
ON a.authorID = w.authorID 
WHERE loanStart = '2020-01-28'
AND b.title = 'Adaptive 4th Generation Model';

-- Question 8
SELECT authorFName, authorLName, title
FROM book b
LEFT JOIN wrote w 
ON b.ISBN = w.wroteISBN
LEFT JOIN author a
ON a.authorID = w.authorID 
WHERE w.wroteISBN IS NULL;
