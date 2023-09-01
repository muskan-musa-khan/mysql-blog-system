
-- Q1
SELECT authorFName, authorLName
FROM author
WHERE authorID =2100;

-- Q2
SELECT count(b.ISBN)
FROM book b 
JOIN wrote w
ON b.ISBN =w.wroteISBN
JOIN author a 
ON w.authorID =a.authorID
WHERE a.authorID= 2100;

-- Q3
SELECT b.title
FROM book b 
JOIN wrote w
ON b.ISBN =w.wroteISBN
JOIN author a 
ON w.authorID =a.authorID
WHERE a.authorID= 2100;

-- Q4
SELECT fName,mName,lName
FROM libuser
WHERE libraryNumber = 'DCD88988829';

-- Q5
SELECT count(l.ISBN)
FROM libuser u 
JOIN loan l
ON u.libraryNumber = l.loanLibraryNumb
WHERE u.fName='Elliott'
AND u.mName='Hieronymus'
AND u.lName='Kleynen'
AND u.libraryNumber='DCD88988829';

-- Q6
SELECT fName,lName
FROM libuser u 
JOIN loan l 
ON u.libraryNumber = l.loanLibraryNumb
JOIN book b 
ON l.ISBN =b.ISBN
WHERE b.title= 'PROFIT-FOCUSED BANDWIDTH-MONITORED UTILISATION';



-- Q7
SELECT upper(fName), upper(lName), lower(b.title)
FROM libuser u 
JOIN loan l 
ON u.libraryNumber = l.loanLibraryNumb
JOIN book b 
ON l.ISBN =b.ISBN
WHERE b.title= 'PROFIT-FOCUSED BANDWIDTH-MONITORED UTILISATION';

-- Q8
SELECT upper(fName) AS First_Name,
       upper(lName) AS Last_Name,
       lower(b.title) AS Books_Borrowed
FROM libuser u 
JOIN loan l 
ON u.libraryNumber = l.loanLibraryNumb
JOIN book b 
ON l.ISBN =b.ISBN
WHERE b.title= 'PROFIT-FOCUSED BANDWIDTH-MONITORED UTILISATION';

-- Q9
SELECT authorFName, authorLName
FROM book b 
JOIN wrote w
ON b.ISBN =w.wroteISBN
JOIN author a 
ON w.authorID =a.authorID
WHERE b.title ='NETWORKED ENCOMPASSING FORECAST';

-- Q10
SELECT a.authorFName,a.authorLName ,b.title
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
WHERE genre ='Anime';

-- Q11 
SELECT b.title
FROM libuser u
JOIN loan l
ON u.libraryNumber = l.loanLibraryNumb
JOIN book b
ON b.ISBN = l.ISBN
JOIN wrote w
ON b.ISBN = w.authorID
JOIN author a
ON w.authorID = a.authorID
JOIN bookgenre bg
ON bg.ISBN = b.ISBN
JOIN genre g
ON g.genreID = bg.genreID
WHERE g.genre = 'thriller'
AND a.authorFName = 'Kinna'
AND a.authorLName = 'Kilfoyle';
