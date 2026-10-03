CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Member Table
CREATE TABLE Member (
    Member_ID INT PRIMARY KEY,
    Member_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Membership_Status VARCHAR(20) DEFAULT 'Active'
);

-- Book Table
CREATE TABLE Book (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(50) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(8,2),
    Availability VARCHAR(20) DEFAULT 'Available',
    Member_ID INT,
    
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID)
);

-- Insert Members
INSERT INTO Member
VALUES
(101, 'Rahul Sharma', 'rahul@gmail.com', '9876543210', 'Active'),
(102, 'Aman Singh', 'aman@gmail.com', '9876543211', 'Active'),
(103, 'Karan Kumar', 'karan@gmail.com', '9876543212', 'Active');

-- Insert Books
INSERT INTO Book
VALUES
(1, 'The Alchemist', 'Paulo Coelho', 'Fiction', 450, 'Available', NULL),
(2, 'Wings of Fire', 'A.P.J. Abdul Kalam', 'Biography', 350, 'Available', 101),
(3, 'Data Structures', 'Seymour Lipschutz', 'Education', 600, 'Issued', 102),
(4, 'The Hobbit', 'J.R.R. Tolkien', 'Fiction', 500, 'Available', NULL),
(5, 'Computer Networks', 'Andrew Tanenbaum', 'Education', 750, 'Available', 103);

-- Display books of a particular category
SELECT *
FROM Book
WHERE Category = 'Fiction';

-- Update availability
UPDATE Book
SET Availability = 'Issued'
WHERE Book_ID = 1;

-- Delete a book
DELETE FROM Book
WHERE Book_ID = 5;

-- Add new column
ALTER TABLE Book
ADD Publisher VARCHAR(100);

-- Rename Book table
RENAME TABLE Book TO Library_Book;

-- Display final records
SELECT * FROM Member;
SELECT * FROM Library_Book;