-- Question 1
SELECT CONCAT(title,' & ',authorFName,' ',authorLName) AS "Title And Author",
       genre AS "Genre"
FROM bookgenre bg
JOIN book b ON b.ISBN = bg.ISBN
JOIN genre g ON g.genreID = bg.genreID
JOIN wrote w ON w.wroteISBN = b.ISBN
JOIN author a ON a.authorID = w.authorID
WHERE g.genre = 'Action';

-- Question 2
SELECT DISTINCT authorFName
FROM author;

-- Question 3
SELECT COUNT(DISTINCT authorFName) AS "Distinct Author First Names"
FROM author;

-- Question 4
SELECT COUNT(*) AS "Total Authors"
FROM author;

-- Question 5
SELECT COUNT(mName) AS "Customers With Middle Names"
FROM libuser;

-- Question 6
SELECT CONCAT_WS(',', authorLName, authorFName) AS "Author But No Books"
FROM author a
LEFT JOIN wrote w
ON w.authorID = a.authorID
WHERE w.authorID IS NULL;

-- Question 7
SELECT CONCAT(fName,' ',mName,' ',lName) AS "Library Users",
       emailAddress AS "Email"
FROM libuser u
LEFT JOIN loan l
ON u.libraryNumber = l.loanLibraryNumb
WHERE l.loanLibraryNumb IS NULL;

-- Question 8
SELECT authorFName, authorLName
FROM author
ORDER BY authorLName DESC;

-- Question 9
SELECT authorFName, authorLName
FROM author
WHERE authorFName LIKE 'B%'
ORDER BY authorLName DESC;

-- Question 10
SELECT b.title, g.genre
FROM book b
JOIN bookgenre bg ON b.ISBN = bg.ISBN
JOIN genre g ON g.genreID = bg.genreID
ORDER BY g.genre;

-- Question 11
SELECT b.title, g.genreID
FROM book b
JOIN bookgenre bg ON b.ISBN = bg.ISBN
JOIN genre g ON g.genreID = bg.genreID
ORDER BY g.genreID ASC;

-- Question 12
SELECT b.title, g.genre
FROM book b
JOIN bookgenre bg ON b.ISBN = bg.ISBN
JOIN genre g ON g.genreID = bg.genreID
ORDER BY g.genre ASC, b.title DESC;
