-- Q1
SELECT b.title, loanStart
FROM libuser u
JOIN loan l
  ON u.libraryNumber = l.loanLibraryNumb
JOIN book b
  ON b.ISBN = l.ISBN 
WHERE fName='Aldo' AND lName ='Fedder';

-- Q2
SELECT b.title
FROM libuser u
JOIN loan l
  ON u.libraryNumber = l.loanLibraryNumb
JOIN book b
  ON b.ISBN = l.ISBN 
JOIN bookgenre bg
  ON bg.ISBN = b.ISBN
JOIN genre g
  ON g.genreID = bg.genreID
WHERE g.genre = 'Action';

-- Q3
SELECT b.title
FROM libuser u
JOIN loan l
  ON u.libraryNumber = l.loanLibraryNumb
JOIN book b
  ON b.ISBN = l.ISBN 
WHERE fName='Roy' AND lName ='Skene' And loanStart= '2020-06-25';

-- Q4
SELECT b.title,g.genre
FROM libuser u
JOIN loan l
  ON u.libraryNumber = l.loanLibraryNumb
JOIN book b
  ON b.ISBN = l.ISBN 
JOIN bookgenre bg
  ON bg.ISBN = b.ISBN
JOIN genre g
  ON g.genreID = bg.genreID
WHERE fName='Roy' AND lName ='Skene' And l.loanStart='2020-06-25';

-- Q5
-- There is no genre associated with the book that "Roy Skene" lended on '2020-06-25' in the genre table.

-- Q6
SELECT b.datePublished
FROM libuser u
JOIN loan l
  ON u.libraryNumber = l.loanLibraryNumb
JOIN book b
  ON b.ISBN = l.ISBN 
WHERE u.libraryNumber ='DDE60951577';

-- Q7
SELECT b.title
FROM libuser u
JOIN loan l
  ON u.libraryNumber = l.loanLibraryNumb
JOIN book b
  ON b.ISBN = l.ISBN 
WHERE u.libraryNumber ='DDE60951577';

-- Q8
SELECT lower(b.title) AS Title
FROM libuser u
JOIN loan l
  ON u.libraryNumber = l.loanLibraryNumb
JOIN book b
  ON b.ISBN = l.ISBN 
WHERE u.libraryNumber ='DDE60951577';

-- Q9
SELECT COUNT(*) AS "Total Books"
FROM book;

-- Q10
SELECT COUNT(*) AS "NO. of books borrowed in DEC 30th 2020"
FROM libuser u
JOIN loan l
  ON u.libraryNumber = l.loanLibraryNumb
WHERE loanStart =' 2020-12-30';

-- Q11
SELECT MIN(loanstart) AS "Earliest Loan start date"
FROM loan;

-- Q12
SELECT MAX(loanstart) AS "Latest Loan start date"
FROM loan;

-- Q13
SELECT MIN(loanstart) AS "First", MAX(loanstart) AS "Last"
FROM loan;

-- Q14
SELECT concat(fName,'',mName,'',lName) AS User,
       libraryNumber AS "Library Number",
       loanStart AS "The LoanStart",
       l.Isbn AS "The Isbn",
       title AS "The Title",
       edition AS "The Edition",
       concat(authorFName,"",authorLName) AS Author,
       genre AS "The genre"
FROM libuser u
JOIN loan l
  ON u.libraryNumber = l.loanLibraryNumb
JOIN book b
  ON b.ISBN = l.ISBN 
JOIN bookgenre bg
  ON bg.ISBN = b.ISBN
JOIN genre g
  ON g.genreID = bg.genreID
JOIN wrote w
  ON b.ISBN = w.wroteISBN
JOIN author a
  ON w.authorID = a.authorID
WHERE fName ='Roxanne' AND mName ='Iona' AND lName ='Noakes';

-- Q15
SELECT count(loanStart)
FROM libuser u
JOIN loan l
  ON u.libraryNumber = l.loanLibraryNumb
JOIN book b
  ON b.ISBN = l.ISBN 
WHERE fName ='Roxanne' AND mName ='Iona' AND lName ='Noakes';

-- Q16
SELECT count(loanStart)
FROM loan
WHERE loanstart >= '2020-11-01'
AND loanstart <= '2020-11-30';
