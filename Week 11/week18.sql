-- Question:1
SELECT count(loanStart) 
FROM loan;

-- Question:2
SELECT COUNT(DISTINCT l.isbn)
FROM loan l;

-- Question:3
SELECT loanStart AS "Latest Loan Date" 
FROM loan 
ORDER BY loanStart DESC 
LIMIT 1; 

-- Question:4
SELECT count(loanStart) 
FROM loan 
WHERE loanStart='2020-12-30';

-- Question:5
SELECT b.title, loanStart 
FROM book b 
JOIN loan l ON b.ISBN = l.ISBN 
WHERE loanStart BETWEEN '2020-10-04' AND '2020-10-10'; 

-- Question:6
SELECT count(loanStart) 
FROM loan 
WHERE loanStart BETWEEN '2020-10-04' AND '2020-10-10'; 

-- Question:7
-- ERD Diagram

-- lib21

-- Question:8
SELECT authorFName, authorLName 
FROM author a 
JOIN wrote w ON a.authorID = w.authorID
JOIN book b ON w.wroteISBN = b.ISBN 
WHERE b.title = 'De-engineered Zero Tolerance Graphic Interface';

-- Question:9
SELECT count(l.loanStart) AS "Total Loans" 
FROM loan l 
JOIN book b ON b.ISBN = l.ISBN 
WHERE b.title = 'De-engineered Zero Tolerance Graphic Interface';

-- Question:10
SELECT CONCAT_WS(' ', fname, mname, lname) AS "User Name",
       l.ISBN AS "Loan ISBN",
       loanStart AS "Loan Start"
FROM libuser u 
LEFT JOIN loan l ON l.loanLibraryNumb = u.libraryNumber
WHERE l.loanLibraryNumb IS NULL;

-- Question:11
-- Unique Keyword

-- Question:12
CREATE TABLE test_table (
  test_id INT PRIMARY KEY, 
  fname VARCHAR(30) NOT NULL, 
  name VARCHAR(30), 
  lname VARCHAR(50) NOT NULL, 
  email VARCHAR(70) UNIQUE NOT NULL
);

-- Question:13
CREATE TABLE test_table_2 (
  test_id2 INT PRIMARY KEY,
  linking_att INT,
  notes VARCHAR(50),
  FOREIGN KEY (linking_att) REFERENCES test_table(test_id)
);
