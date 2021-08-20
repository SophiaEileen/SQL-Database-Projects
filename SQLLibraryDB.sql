CREATE DATABASE libraryDB
GO

USE libraryDB
GO

--CREATE Library Branch Table
CREATE TABLE LIBRARY_BRANCH(
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BranchName VARCHAR(50) NOT NULL,
	[Address] VARCHAR(75) NOT NULL
);

--INSERT into the LIBRARY_BRANCH table 6 values one must be Sharpstown
INSERT INTO LIBRARY_BRANCH
	(BranchName, [Address])
	VALUES
	('Sharpstown', '27389 Wherever Ct., XF 38485'),
	('Jacksonville', '303 N Laura St., FL 32202'),
	('Yulee', '76346 William Burgess Blvd., FL 32097'),
	('Fernandina Beach', '25 N 4th St., FL 32034'),
	('St. Augustine', '1960 N Ponce De Leon Blvd., FL 32084'),
	('Callahan', '450077 State Rd. 200 #15, FL 32011')
;
SELECT * FROM LIBRARY_BRANCH;

--CREATE PUBLISHER Table
CREATE TABLE PUBLISHER(
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	[Address] VARCHAR(100) NOT NULL,
	Phone VARCHAR(16) NOT NULL,
);

--INSERT into PUBLISHER table 10 values.
INSERT INTO PUBLISHER
	(PublisherName, [Address], Phone)
	VALUES
	('Moore and Poesy Publishing', '6217 St. Augustine Rd. Jacksonville, FL 32217', '(904) 899-1776'),
	('Heritage Publishing, Inc.', '9250 Baymeadows Rd. Suite 460, FL 32256', '(904) 296-1304'),
	('Alpha Book Publisher', '320 Waterville Rd. Jacksonville, FL 32226', '(904) 827-5632'),
	('Global Publishing, Inc.', '9799 Old St. Augustine Rd, FL 32257', '(904) 262-0491'),
	('Jacksonville Magazine', '1531 Osceola St. Jacksonville, FL 32204', '(904) 389-3622'),
	('Free Press Publishing Services', '6980 US-1 St. Augustine, FL 32095', '(904) 827-9030'),
	('Heirs House Publishing', '544 Willow Walk Pl. St. Augustine, FL 32086', '(904) 794-5343'),
	('BluewaterPress LLC', '52 Tuscan Way St. Augustine, FL 32092', '(888) 247-0793'),
	('Blue Hawk Publishing', '96196 Bay View Dr. Fernandina Beach, FL 32034', '(904) 432-7145'),
	('Heyday Publishing, Inc.', '1648 Brookside Cir E, Jacksonville, FL 32207', '(904) 399-0473')
;
SELECT * FROM PUBLISHER;

--CREATE BORROWER Table
CREATE TABLE BORROWER(
	CardNo INT PRIMARY KEY NOT NULL,
	[Name] VARCHAR(50) NOT NULL,
	[Address] VARCHAR(75) NOT NULL,
	Phone VARCHAR(20) NOT NULL
);

--INSERT into the BORROWER table 8 values 
INSERT INTO BORROWER
	(CardNo, [Name], [Address], Phone)
	VALUES
	(10001, 'Rebecca Jones', '1618 Saturn Rd. St. Augustine, FL 32084', '904-827-3656'),
	(10002, 'Camille Smith', '304 Unicorn Rd. St. Augustine, FL 32086', '907-827-1992'),
	(10003, 'Jeanine Forester', '589 Wedgefield Rd. Jacksonville, FL 32205', '904-321-6924'),
	(10004, 'Harry Callaway', '895 Merrill Rd. Jacksonville, FL 32246', '904-561-8243'),
	(10005, 'Ian Curtis', '1980 Joy Division Rd. Jacksonville, FL 32206', '904-895-3492'),
	(10006, 'Howle North', '215 GreenCastle Rd. Jacksonville, FL 32205', '779-514-8939'),
	(10007, 'Sally Johns', '825 Laffites Way Yulee, FL 32097', '904-321-1238'),
	(10008, 'Tom Riddle', '668 Hill Top St. Callahan, FL 32011', '(904) 885-4672')
;
SELECT * FROM BORROWER;

--CREATE BOOKS Table
CREATE TABLE BOOKS(
	BookID INT PRIMARY KEY NOT NULL IDENTITY(10,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) CONSTRAINT fk_PublisherName REFERENCES PUBLISHER(PublisherName)
);

--INSERT INTO BOOKS 20 rows of different books. Assign one book title with the value The Lost Tribe
INSERT INTO BOOKS
	(Title, PublisherName)
	VALUES
	('Frankenstein','Moore and Poesy Publishing'),
	('Nineteen Eighty-Four','Heritage Publishing'),
	('Dune','Alpha Book Publisher'),
	('The Time Machine','Global Publishing, Inc'),
	('War of the Worlds','Heirs House Publishing'),
	('Brave New World','Free Press Publishing Services'),
	('20,000 Leagues Under the Sea','BluewaterPress LLC'),
	('Journey To The Center Of The Earth','Jacksonville Magazine'),
	('I, Robot','Blue Hawk Publishing'),
	('Slaughterhouse Five','Heyday Publishing, Inc.'),
	('The Foundation Trilogy','Heritage Publishing'),
	('2001: A Space Odyssey','Heirs House Publishing'),
	('The Martian Chronicles','Blue Hawk Publishing'),
	('Fahrenheit 451','Global Publishing, Inc'),
	('I Am Legend','BluewaterPress LLC'),
	('A Clockwork Orange','Jacksonville Magazine'),
	('[The Hitchhiker’s Guide to the Galaxy]','Heyday Publishing'),
	('A Wrinkle in Time','Global Publishing, Inc'),
	('Jurassic Park','Jacksonville Magazine'),
	('The Lost Tribe','BluewaterPress LLC')
;
SELECT * FROM BOOKS;

--CREATE BOOK_COPIES Table
CREATE TABLE BOOK_COPIES(
	BookID INT CONSTRAINT fk_BookID FOREIGN KEY REFERENCES BOOKS(BookID),
	BranchID INT CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID),
	Number_Of_Copies INT NOT NULL
);

--INSERT INTO BOOK_COPIES table
INSERT INTO BOOK_COPIES
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(29,6,4),
	(11,3,2),
	(12,5,4),
	(13,6,3),
	(14,1,3),
	(15,1,2),
	(16,2,5),
	(17,2,2),
	(18,5,3),
	(19,6,3),
	(20,2,4),
	(21,4,4),
	(22,4,2),
	(23,3,3),
	(29,5,2),
	(25,3,5),
	(26,5,4),
	(27,4,2),
	(28,6,4),
	(29,2,3)
;
SELECT * FROM BOOK_COPIES;

--CREATE BOOK_AUTHORS Table
CREATE TABLE BOOK_AUTHORS(
	BookID INT, 
	AuthorName VARCHAR(50) NOT NULL,
);

--INSERT INTO BOOK_AUTHORS table 10 different author names
INSERT INTO BOOK_AUTHORS
	(BookID, AuthorName)
	VALUES
	(10,'Mary Shelley'),
	(18, 'George Orwell'),
	(20,'Frank Herbert'),
	(11,'H.G. Wells'),
	(14,'Aldous Huxley'),
	(17,'Jules Verne'),
	(23,'Kurt Vonnegut'),
	(25,'Arthur C. Clarke'),
	(22,'Ray Bradbury'),
	(26,'Anthony Burgess')
;
SELECT * FROM BOOK_AUTHORS;

--CREATE BOOK_LOANS Table
CREATE TABLE BOOK_LOANS(
	BookID INT CONSTRAINT fk_BookIDLoan REFERENCES BOOKS(BookID),
	BranchID INT CONSTRAINT fk_BranchIDLoan REFERENCES LIBRARY_BRANCH(BranchID),
	CardNo INT CONSTRAINT fk_CardNoLoan REFERENCES BORROWER(CardNo),
	DateOut VARCHAR(20) NOT NULL,
	DateDue varchar(20) NOT NULL
);

/* ERROR MSG: The INSERT statement conflicted with the FOREIGN KEY constraint "fk_CardNo". <<<<<<<<<<<<<<<<<<<<
 * The conflict occurred in database "libraryDB", table "dbo.BORROWER", column 'CardNo'. <<<<<<<<<<<<<<<<<<<<
 */
 
--INSERT INTO BOOK_LOANS table 10 rows 
INSERT INTO BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(10, 6, 10001, 20200312, 20200512),
	(11, 3, 10002, 20200115, 20200315),
	(14, 2, 10003, 20200109, 20200309),
	(12, 2, 10004, 20200402, 20200602),
	(13, 2, 10005, 20200122, 20200322),
	(19, 1, 10006, 20200228, 20200428),
	(22, 5, 10007, 20191101, 20200101),
	(24, 4, 10007, 20191214, 20200214),
	(26, 6, 10001, 20200311, 20200511),
	(20, 1, 10002, 20200321, 20200321)
;
SELECT * FROM BOOK_LOANS;

--FULL OUTER JOIN Query
SELECT *
FROM BOOK_LOANS
FULL OUTER JOIN BORROWER ON BOOK_LOANS.CardNo = BORROWER.CardNo
FULL OUTER JOIN BOOKS ON BOOK_LOANS.BookID = BOOKS.BookID;

--Query that returns all book titles and the authors name
SELECT BOOKS.Title, BOOK_AUTHORS.AuthorName
FROM BOOKS 
INNER JOIN BOOK_AUTHORS ON BOOKS.BookID = BOOK_AUTHORS.BookID;

--Stored PROCEDURE of how many copies of the book titled "The Lost Tribe" are owned by the library branch whos name is "Sharptown"?
/*CREATE PROCEDURE .lostTribeOwnedSharptown
AS
	SELECT BOOK_COPIES.Number_Of_Copies [Sharpstown Copies]
	FROM LIBRARY_BRANCH
	INNER JOIN BOOK_COPIES ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
	WHERE LIBRARY_BRANCH.BranchID = 2 AND BOOK_COPIES.BookID = 29;
GO*/

--EXECUTE PROCEDURE to find how many copies of the book titled "The Lost Tribe" are owned by Sharpton
EXEC [dbo].[lostTribeOwnedSharptown];

--Stored PROCEDURE of how many copies of the book titled "The Lost Tribe" are owned by each library branch?
/*CREATE PROCEDURE .lostTribeOwnedAllLibraries
AS
	SELECT BOOK_COPIES.Number_Of_Copies [# of Copies]
	FROM LIBRARY_BRANCH
	INNER JOIN BOOK_COPIES ON BOOK_COPIES.BranchID = LIBRARY_BRANCH.BranchID
	WHERE BOOK_COPIES.BookID = 29;
GO*/

--EXECUTE PROCEDURE to find how many copies of the book title "The Lost Tribe" are owned by each library branch
EXEC [dbo].[lostTribeOwnedAllLibraries];

--Stored PROCEDURE will retrieve the names of all borrowers who do not have any books checked out.
/*CREATE PROCEDURE .borrowersWithNoBooks
AS 
SELECT BORROWER.[Name] 
FROM BORROWER
WHERE NOT EXISTS(
	SELECT BORROWER.[Name] FROM BOOK_LOANS
	WHERE BORROWER.CardNo = BOOK_LOANS.CardNo)
GO*/

--EXECUTE SP for borrowers who do not have any books checked out.
EXEC [dbo].[borrowersWithNoBooks];