				 /*_______________________________________________
                       LOAN PORTFOLIO & RISK ANALYSIS SYSTEM
			       _______________________________________________*/

CREATE DATABASE loan_db;

USE loan_db;

CREATE TABLE LOAN (
    Loan_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Customer_Name VARCHAR(50) NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female')),
    Age INT CHECK (Age >= 18),
    City VARCHAR(30),
    State VARCHAR(30),
    Employment_Type VARCHAR(20),
    Annual_Income DECIMAL(12,2) CHECK (Annual_Income > 0),
    Loan_Type VARCHAR(20) CHECK 
        (Loan_Type IN ('Home', 'Personal', 'Car', 'Education', 'Business')),
    Loan_Amount DECIMAL(12,2) CHECK (Loan_Amount > 0),
    Interest_Rate DECIMAL(5,2) CHECK (Interest_Rate > 0),
    Loan_Term INT,
    Application_Date DATE,
    Approval_Date DATE,
    Disbursement_Date DATE,
    Loan_Status VARCHAR(20) CHECK 
        (Loan_Status IN ('Applied', 'Approved', 'Rejected', 'Disbursed', 'Closed')),
    Credit_Score INT CHECK 
        (Credit_Score BETWEEN 300 AND 900),
    Monthly_EMI DECIMAL(10,2),
    Amount_Paid DECIMAL(12,2),
    Outstanding_Amount DECIMAL(12,2),
    Overdue_Amount DECIMAL(12,2),
    Payment_Status VARCHAR(20) CHECK 
        (Payment_Status IN ('Paid', 'Pending', 'Overdue', 'Default'))
);



INSERT INTO LOAN VALUES
(1001, 501, 'Amit Sharma', 'Male', 35, 'Delhi', 'Delhi', 'Salaried', 900000, 'Home', 5000000, 8.50, 240, '2026-01-05', '2026-01-08', '2026-01-10', 'Disbursed', 780, 43391, 500000, 4500000, 0, 'Paid'),

(1002, 502, 'Priya Verma', 'Female', 29, 'Mumbai', 'Maharashtra', 'Salaried', 650000, 'Personal', 800000, 12.50, 60, '2026-01-07', '2026-01-09', '2026-01-12', 'Disbursed', 720, 17992, 180000, 620000, 0, 'Paid'),

(1003, 503, 'Rahul Singh', 'Male', 42, 'Bangalore', 'Karnataka', 'Business', 1200000, 'Business', 2500000, 11.00, 120, '2026-01-10', '2026-01-15', '2026-01-18', 'Disbursed', 680, 34400, 300000, 2200000, 25000, 'Overdue'),

(1004, 504, 'Sneha Gupta', 'Female', 31, 'Pune', 'Maharashtra', 'Salaried', 750000, 'Car', 1200000, 9.25, 60, '2026-01-12', '2026-01-14', '2026-01-16', 'Disbursed', 810, 25000, 100000, 1100000, 0, 'Paid'),

(1005, 505, 'Vikas Kumar', 'Male', 27, 'Delhi', 'Delhi', 'Self-Employed', 550000, 'Personal', 500000, 14.50, 36, '2026-01-15', '2026-01-20', NULL, 'Approved', 640, 17200, 0, 500000, 0, 'Pending'),

(1006, 506, 'Neha Kapoor', 'Female', 24, 'Jaipur', 'Rajasthan', 'Salaried', 450000, 'Education', 600000, 10.50, 60, '2026-01-18', '2026-01-21', '2026-01-25', 'Disbursed', 750, 12900, 50000, 550000, 0, 'Paid'),

(1007, 507, 'Rohit Mehta', 'Male', 45, 'Chennai', 'Tamil Nadu', 'Business', 1500000, 'Business', 4000000, 13.00, 120, '2026-01-20', '2026-01-25', '2026-01-28', 'Disbursed', 590, 53000, 400000, 3600000, 150000, 'Default'),

(1008, 508, 'Anjali Patel', 'Female', 38, 'Ahmedabad', 'Gujarat', 'Salaried', 1000000, 'Home', 3500000, 8.75, 180, '2026-01-22', '2026-01-25', '2026-01-30', 'Disbursed', 800, 31000, 350000, 3150000, 0, 'Paid'),

(1009, 509, 'Suresh Yadav', 'Male', 52, 'Lucknow', 'Uttar Pradesh', 'Self-Employed', 700000, 'Personal', 900000, 15.00, 60, '2026-01-25', '2026-01-28', '2026-02-01', 'Disbursed', 610, 21500, 100000, 800000, 75000, 'Overdue'),

(1010, 510, 'Pooja Malhotra', 'Female', 33, 'Kolkata', 'West Bengal', 'Salaried', 850000, 'Car', 1500000, 9.75, 60, '2026-01-28', '2026-02-01', '2026-02-04', 'Disbursed', 770, 31500, 200000, 1300000, 0, 'Paid'),

(1011, 511, 'Arjun Rao', 'Male', 40, 'Hyderabad', 'Telangana', 'Business', 1100000, 'Business', 3000000, 12.00, 120, '2026-02-02', '2026-02-06', '2026-02-10', 'Disbursed', 690, 43000, 250000, 2750000, 30000, 'Overdue'),

(1012, 512, 'Kavita Joshi', 'Female', 28, 'Delhi', 'Delhi', 'Salaried', 600000, 'Education', 400000, 10.00, 48, '2026-02-05', '2026-02-08', '2026-02-12', 'Disbursed', 735, 10150, 100000, 300000, 0, 'Paid'),

(1013, 513, 'Manish Agarwal', 'Male', 36, 'Noida', 'Uttar Pradesh', 'Self-Employed', 800000, 'Home', 2800000, 9.00, 180, '2026-02-08', '2026-02-12', '2026-02-15', 'Disbursed', 760, 28300, 200000, 2600000, 0, 'Paid'),

(1014, 514, 'Riya Shah', 'Female', 30, 'Surat', 'Gujarat', 'Salaried', 500000, 'Personal', 700000, 13.50, 60, '2026-02-10', '2026-02-14', NULL, 'Approved', 670, 15900, 0, 700000, 0, 'Pending'),

(1015, 515, 'Deepak Mishra', 'Male', 48, 'Bhopal', 'Madhya Pradesh', 'Business', 950000, 'Business', 1800000, 14.00, 84, '2026-02-12', NULL, NULL, 'Rejected', 540, 0, 0, 0, 0, 'Pending'),

(1016, 516, 'Meena Iyer', 'Female', 55, 'Chennai', 'Tamil Nadu', 'Salaried', 1250000, 'Home', 4500000, 8.25, 240, '2026-02-15', '2026-02-18', '2026-02-20', 'Disbursed', 820, 38200, 450000, 4050000, 0, 'Paid'),

(1017, 517, 'Karan Bansal', 'Male', 26, 'Gurgaon', 'Haryana', 'Salaried', 480000, 'Car', 900000, 10.25, 60, '2026-02-18', '2026-02-22', '2026-02-25', 'Disbursed', 700, 19200, 50000, 850000, 10000, 'Overdue'),

(1018, 518, 'Nisha Reddy', 'Female', 34, 'Hyderabad', 'Telangana', 'Self-Employed', 720000, 'Personal', 1000000, 14.00, 60, '2026-02-20', '2026-02-24', '2026-02-28', 'Disbursed', 630, 23200, 100000, 900000, 50000, 'Overdue'),

(1019, 519, 'Sameer Khan', 'Male', 43, 'Mumbai', 'Maharashtra', 'Business', 1400000, 'Business', 5000000, 12.50, 120, '2026-02-22', '2026-02-26', '2026-03-01', 'Disbursed', 580, 70000, 500000, 4500000, 200000, 'Default'),

(1020, 520, 'Divya Nair', 'Female', 32, 'Kochi', 'Kerala', 'Salaried', 900000, 'Home', 3200000, 8.50, 180, '2026-02-25', '2026-02-28', '2026-03-03', 'Closed', 790, 28500, 3200000, 0, 0, 'Paid');


