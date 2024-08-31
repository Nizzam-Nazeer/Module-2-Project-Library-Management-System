-- Create the database
CREATE DATABASE library;
USE library;
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);
-- Insert data into Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, 'South Kalamassery,Ernakulam', '0484-257754'),
(2, 102, 'Ranipuram,Kasargod', '0484-325482'),
(3, 103, 'Shavakkotapalam,Alappuzha', '0484-253614'),
(4, 104, 'Cheruthoni ,Idukki', '0484-845942'),
(5, 105, 'Pettimudi,Wayanad', '0484-759486'),
(6, 106, 'Tirur,Malappuram', '0484-123454'),
(7, 107, 'Veli,Trivandrum', '0484-326541'),
(8, 108, 'Kadalundi,Kozhikode', '0484-754896'),
(9, 109, 'Paravur,Kollam', '0484-154862'),
(10, 110, 'Mundakkayam,Kottatyam', '0484-325146');
desc table branch;
select * from branch;
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
-- Insert data into Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(1, 'Smitha Nazeer', 'Manager', 60000.00, 1),
(2, 'Nazeer A A', 'Assistant', 45000.00, 1),
(3, 'Nisma Raneesh', 'Manager', 65000.00, 2),
(4, 'Salman Rasheed', 'Assistant', 42000.00, 2),
(5, 'Aysha A', 'Manager', 70000.00, 3),
(6, 'Amarjith A', 'Assistant', 46000.00, 3),
(7, 'Asiya Ziad', 'Manager', 62000.00, 4),
(8, 'Sujith B S', 'Assistant', 43000.00, 4),
(9, 'Hamidha Kassim', 'Manager', 68000.00, 5),
(10, 'Raizan Hanzal', 'Assistant', 44000.00, 5);
select * from employee;
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);
-- Insert data into Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('9780061120084', 'To Kill a Mockingbird', 'Fiction', 25.00, 'Yes', 'Harper Lee', 'J.B. Lippincott'),
('9780452284234', '1984', 'Dystopian', 20.00, 'no', 'George Orwell', 'Secker & Warburg'),
('9781594202510', 'The Road','Fiction',15.00,'Yes','Cormac McCarthy','Vintage Books'),
('9781402894626', 'The Immortal Life of Henrietta Lacks','Non-Fiction',54.50,'No','Rebecca Skloot','Crown Publishing'),
('9780071808552', 'The Lean Startup','Business',86.00,'Yes','Eric Ries','Crown Business'),
('9781476791803', 'The Goldfinch','Fiction',85.50,'No','Donna Tartt','Little, Brown and Company'),
('9780743273565', 'The Da Vinci Code','Thriller',	44.00,	'Yes','Dan Brown','Doubleday'),
('9781501176816', 'Where the Crawdads Sing','Fiction',45.00,'yes','Delia Owens','G.P.Putnams Sons'),
('9780679642310', 'A Brief History of Time','Science',150.00,'No','Stephen Hawking','Bantam Books'),
('9780743273572', 'Blink', 'Non-Fiction',50.00,	'Yes','Malcolm Gladwell',	'Little, Brown and Company');
select * from books;
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);
-- Insert data into Customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'Nizzam Nazeer', 'Areekodath House,Ernakulam', '2019-06-15'),
(2, 'Anusha Sunil', 'Poolakandy house,Kozhikode', '2021-02-01'),
(3, 'Aravind S', 'Tharavad,Palakkad', '2019-08-22'),
(4, 'John cena', 'Kunnumal,Thrissur', '2018-01-10'),
(5, 'David Beckham', 'Kadaloram house,Malappuram', '2021-08-05'),
(6, 'Sinan M', 'Kaatile house,Kollam', '2019-07-01'),
(7, 'Jaison', 'Maveli house,Trivandrum', '2022-10-23'),
(8, 'Samson Keni', 'Sahrudaya House, Ernakulam', '2021-11-30'),
(9, 'Sarosh Sam', 'Malayil House, Kannur', '2021-08-05'),
(10, 'Sukunan M', 'Thenvid, Idukki', '2022-04-10');
select * from customer;
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issue_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
-- Insert data into IssueStatus table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issue_date, Isbn_book) VALUES
(1, 1, '2023-06-15', '9780061120084'),
(2, 2, '2023-07-01', '9780452284234'),
(3, 3, '2023-05-20', '9781594202510'),
(4, 4, '2023-08-10', '9781402894626'),
(5, 5, '2023-06-25', '9780071808552'),
(6, 6, '2023-07-30', '9781476791803'),
(7, 7, '2023-06-10', '9780743273565'),
(8, 8, '2023-05-15', '9781501176816'),
(9, 9, '2023-07-22', '9780679642310'),
(10, 10, '2023-06-05', '9780743273572');
select * from IssueStatus;
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(13),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
-- Insert data into ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(1, 1, 'To Kill a Mockingbird', '2023-07-01', '9780061120084'),
(2, 2, '1984', '2023-07-20', '9780452284234'),
(3, 3, 'The Road', '2023-06-30', '9781594202510'),
(4, 4, 'The Immortal Life of Henrietta Lacks', '2023-08-15', '9781402894626'),
(5, 5, 'The Lean Startup', '2023-07-10', '9780071808552'),
(6, 6, 'The Goldfinch', '2023-08-01', '9781476791803'),
(7, 7, 'The Da Vinci Code', '2023-06-25', '9780743273565'),
(8, 8, 'Where the Crawdads Sing', '2023-06-15', '9781501176816'),
(9, 9, 'A Brief History of Time', '2023-07-10', '9780679642310'),
(10, 10, 'Blink', '2023-06-12', '9780743273572');
select * from ReturnStatus;
-- 1.Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';
-- 2.List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;
-- 3.Retrieve the book titles and the corresponding customers who have issued those books.
SELECT b.Book_title, c.Customer_name FROM IssueStatus i
JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id;
-- 4.Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Count FROM Books GROUP BY Category;
-- 5.Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;
-- 6.List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT c.Customer_name FROM Customer c LEFT JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE c.Reg_date < '2023-01-01' AND i.Issued_cust IS NULL;
-- 7.Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no;
-- 8.Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT c.Customer_name FROM IssueStatus i JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE i.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';
-- 9.Retrieve book_title from the book table containing history.
SELECT DISTINCT b.Book_title FROM Books b JOIN IssueStatus i ON b.ISBN = i.Isbn_book
UNION
SELECT DISTINCT b.Book_title
FROM Books b
JOIN ReturnStatus r ON b.ISBN = r.Isbn_book2;
-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 1 employees.
SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no
HAVING COUNT(*) > 1;
-- 11.Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT e.Emp_name, b.Branch_address FROM Employee e JOIN Branch b ON e.Branch_no = b.Branch_no
WHERE e.Position = 'Manager';
-- 12 Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT DISTINCT c.Customer_name FROM IssueStatus i JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE b.Rental_Price > 25;
