				 /*_______________________________________________
                       LOAN PORTFOLIO & RISK ANALYSIS SYSTEM
			       _______________________________________________*/

USE loan_db;

SELECT * FROM loan;

-------------------------------------------------------------------------
                         #Basic SQL Analysis
-------------------------------------------------------------------------
 
#Write SQL queries to:

#1.	Display all loan records

SELECT * FROM loan;

#2.	Display only customer name, city, loan type and loan amount.

SELECT Customer_Name,City,Loan_Type,Loan_Amount
FROM loan;

#3.	Find all customers who have applied for a Personal Loan.

SELECT Customer_Name
FROM loan
WHERE Loan_Type='Personal';

#4.	Find customers whose loan amount is greater than ₹5,00,000.

SELECT Customer_Name
FROM loan
WHERE Loan_Amount>500000;

#5.	Find customers from Delhi.

SELECT Customer_Name 
FROM loan
WHERE City='Delhi';

#6.	Display customers whose credit score is greater than 750.

SELECT Customer_Name
FROM loan
WHERE Credit_Score>750;

#7.	Find customers whose annual income is between ₹5 lakh and ₹15 lakh.

SELECT Customer_Name
FROM loan
WHERE Annual_Income  between 500000 and 1500000;

#8.	Display all customers whose loan status is Approved.

SELECT Customer_Name
FROM loan
WHERE Loan_Status ='Approved';

#9.	Find all customers whose payment status is Overdue.

SELECT Customer_Name
FROM loan
WHERE Payment_Status='Overdue';

#10.Display loans where outstanding amount is greater than ₹2,00,000.

SELECT *
FROM loan
WHERE Outstanding_Amount>200000;

-------------------------------------------------------------------------
                            # Filtering & Sorting
-------------------------------------------------------------------------

#Write queries to:

#11.	Display the 10 largest loans.

SELECT *
FROM loan
WHERE Loan_Status != 'Rejected'
ORDER BY Loan_Amount DESC
LIMIT 10;

#12.	Display customers in descending order of credit score.

SELECT *
FROM loan
ORDER BY Credit_Score DESC;

#13.Display customers in ascending order of loan amount.

SELECT *
FROM loan
ORDER BY Loan_Amount;

#14.Find loans with interest rates greater than 10%.

SELECT *
FROM loan
WHERE Interest_Rate>10;

#15.Find customers between the ages of 25 and 40.

SELECT *
FROM loan
WHERE Age BETWEEN 25 AND 40;

#16.Find customers whose names start with A.

SELECT *
FROM loan
WHERE Customer_Name LIKE 'A%';

#17.Find customers whose city contains the letter a.

SELECT *
FROM loan
WHERE city LIKE '%a%';

#18.Find customers who are not from a Maharashtra state.

SELECT *
FROM loan
WHERE  State !='Maharashtra';

#19.Find loans that are either Approved or Disbursed.

SELECT *
FROM loan
WHERE Loan_Status IN ('Approved','Disbursed');

#20.Find customers whose payment status is not Paid.

SELECT *
FROM loan
WHERE Payment_Status !='Paid';

-------------------------------------------------------------------------
                         #Aggregate Analysis
-------------------------------------------------------------------------

#Management wants summary-level information.
 
#Write queries to find:

#21.Total number of loan applications

SELECT COUNT(Loan_ID)
FROM loan;

#22.Total number of approved loans.

SELECT COUNT(Loan_ID)
FROM loan
WHERE Loan_Status='Approved';

#23.Total loan amount requested.

SELECT SUM(Loan_Amount) AS Total_Loan_Amount_Requested
FROM loan;

#24.Total loan amount disbursed.

SELECT SUM(Loan_Amount) AS Total_Loan_Amount_Disbursed
FROM loan
WHERE Loan_Status='Disbursed';

#25.Total outstanding loan amount.

SELECT SUM(Outstanding_Amount) AS Total_Outstanding_Loan_Amount
FROM loan;

#26.Total overdue amount.

SELECT SUM(Overdue_Amount) AS Total_Overdue_Amount
FROM loan;

#27.Average loan amount.

SELECT AVG(Loan_Amount) AS Average_Loan_Amount
FROM loan;

#28.Average interest rate.

SELECT AVG(Interest_Rate) AS Average_Interest_Rate
FROM loan;

#29.Maximum loan amount.

SELECT MAX(Loan_Amount) AS Maximum_Loan_Amount
FROM loan;

#30.Minimum loan amount.

SELECT MIN(Loan_Amount) AS Minimum_Loan_Amount
FROM loan;

#31.Average credit score.

SELECT AVG(Credit_Score) AS Average_credit_Score
FROM loan;

#32.Average annual income of borrowers.

SELECT AVG(Annual_Income) AS Average_Annual_Income
FROM loan;

-------------------------------------------------------------------------
                           #GROUP BY Analysis
-------------------------------------------------------------------------  
  
#Analyze the loan portfolio by different business dimensions.

#33.Find the number of loans for each loan type

SELECT Loan_Type,count(Loan_Type) AS Number_Of_Loans
FROM loan
GROUP BY Loan_Type;

#34.Find total loan amount for each loan type.

SELECT Loan_Type,SUM(Loan_Amount) AS Total_Loan_Amount
FROM loan
GROUP BY Loan_Type;

#35.Find average loan amount for each loan type.

SELECT Loan_Type,avg(Loan_Amount) AS Average_Loan_Amount
FROM loan 
GROUP BY Loan_Type;

#36.Find total loan amount by city.

SELECT City,SUM(Loan_Amount) AS Total_Loan_Amount
FROM loan
GROUP BY City;

#37.Find number of customers by state.

SELECT State,COUNT(Customer_ID) AS Number_Of_Customers
FROM loan
GROUP BY State;

#38.Find average credit score by loan type.

SELECT Loan_Type,AVG(Credit_Score) AS Average_Credit_Score
FROM loan
GROUP BY Loan_Type;

#39.Find total outstanding amount by loan type.

SELECT Loan_Type,SUM(Outstanding_Amount) AS Total_Outstanding_Amount
FROM loan
GROUP BY Loan_Type;

#40.Find total overdue amount by city.

SELECT City,SUM(Overdue_Amount) AS Total_Overdue_Amount
FROM loan
GROUP BY City;

#41.Find the number of loans by payment status.

SELECT Payment_Status,COUNT(Loan_ID) AS Number_Of_Loans
FROM loan
GROUP BY Payment_Status;

#42.Find the number of loans by employment type.

SELECT Employment_Type,COUNT(Loan_ID) AS Number_Of_Loans
FROM loan
GROUP BY Employment_Type;

-------------------------------------------------------------------------
							#HAVING Clause
-------------------------------------------------------------------------
   
#43.Find loan types having more than 5 loans.

SELECT Loan_Type,COUNT(Loan_ID)
FROM loan
GROUP BY Loan_Type
HAVING COUNT(Loan_Type)>5;

#44.Find cities where total loan disbursement is greater than ₹50 lakh.

SELECT City,SUM(Loan_Amount) AS Total_Loan_Disbursement
FROM loan
WHERE Loan_Status='Disbursed'
GROUP BY City
HAVING SUM(Loan_Amount)>5000000;

#45.Find loan types whose average loan amount is greater than ₹3 lakh.

SELECT Loan_Type,AVG(Loan_Amount) AS Average_Loan_Amount
FROM loan
GROUP BY Loan_Type
HAVING AVG(Loan_Amount)>300000;

#46.Find cities having total overdue amount greater than ₹1 lakh.

SELECT City,SUM(Overdue_Amount) AS Total_Overdue_Amount
FROM loan
GROUP BY City
HAVING SUM(Overdue_Amount)>100000;

#47.Find employment types having more than 10 borrowers.

SELECT Employment_Type,COUNT(Loan_ID) AS Borrowers
FROM loan
GROUP BY Employment_Type
HAVING COUNT(Loan_ID)>10;

-------------------------------------------------------------------------
                               #CASE Statement
-------------------------------------------------------------------------
  
   /*Risk Classification
Create a new calculated column called Risk_Category using the credit score.
Use the following business rules:

Credit Score	Risk Category
750+	         Low Risk
650–749	         Medium Risk
550–649	         High Risk
Below 550	     Very High Risk */

#48.Display customer name, credit score and risk category.

SELECT Customer_Name,Credit_Score,
    CASE 
       WHEN Credit_Score >=750 THEN 'Low Risk'
       WHEN credit_score BETWEEN 650 AND 749 THEN 'Medium Risk'
	   WHEN credit_score BETWEEN 550 AND 649 THEN 'High Risk'
       ELSE 'Very High Risk' 
     END AS Risk_category
FROM loan;

#49.Count customers in each risk category.

SELECT 
     CASE 
       WHEN Credit_Score >=750 THEN 'Low Risk'
       WHEN credit_score BETWEEN 650 AND 749 THEN 'Medium Risk'
	   WHEN credit_score BETWEEN 550 AND 649 THEN 'High Risk'
       ELSE 'Very High Risk' 
     END AS Risk_category,
     COUNT(DISTINCT Customer_ID) AS Customer_Count
FROM loan
GROUP BY  
    CASE 
       WHEN Credit_Score >=750 THEN 'Low Risk'
       WHEN credit_score BETWEEN 650 AND 749 THEN 'Medium Risk'
	   WHEN credit_score BETWEEN 550 AND 649 THEN 'High Risk'
       ELSE 'Very High Risk' 
     END;

#50.Find the total outstanding amount for each risk category.

SELECT 
     CASE 
		WHEN Credit_Score >750 THEN 'Low Risk'
        WHEN Credit_Score BETWEEN 650 AND 749 THEN 'Medium Risk'
        WHEN Credit_Score BETWEEN 550 AND 649 THEN 'High Risk'
        ELSE 'very high risk' 
	 END AS Risk_category,
     SUM(Outstanding_Amount) AS Total_Outstanding_Amount
FROM loan
GROUP BY Risk_category;

#51.Find the total overdue amount for each risk category.

SELECT 
     CASE 
		WHEN Credit_Score >750 THEN 'Low Risk'
        WHEN Credit_Score BETWEEN 650 AND 749 THEN 'Medium Risk'
        WHEN Credit_Score BETWEEN 550 AND 649 THEN 'High Risk'
        ELSE 'very high risk' 
	 END AS Risk_category,
     SUM(Overdue_Amount) AS Total_Overdue_Amount
FROM loan
GROUP BY Risk_category;

-------------------------------------------------------------------------
                            #Business KPI Analysis
-------------------------------------------------------------------------  
  
#Calculate the following KPIs:

#52.Loan Approval Rate

SELECT 
     count(CASE WHEN Loan_Status='Approved' THEN 1 END)*100.0
     /count(Loan_ID) AS Loan_Approval_Rate
FROM loan;

#53.Loan Rejection Rate

SELECT 
     count(CASE WHEN Loan_Status='Rejected' THEN 1 END)*100.0
     /count(Loan_ID) AS Loan_Rejection_Rate
FROM loan;

#54.Average Loan Amount

SELECT AVG(Loan_Amount)
FROM loan;

#55.Total Disbursed Amount

SELECT SUM(Loan_Amount)
FROM loan
WHERE Loan_Status='Disbursed';

#56.Total Outstanding Amount

SELECT SUM(Outstanding_Amount)
FROM loan;

#57.Total Overdue Amount

SELECT SUM(Overdue_Amount)
FROM loan;

#58.Average Credit Score

SELECT AVG(Credit_Score)
FROM loan;

#59.Default Customer Count

SELECT COUNT(Customer_ID) as Default_Customer_Count
FROM loan
WHERE Payment_Status='Default'; 

#60.Percentage of Overdue Loans

SELECT
     COUNT(CASE WHEN Payment_Status='Overdue' THEN 1 END)*100.0
     /COUNT(Loan_ID) AS Percentage_Of_Overdue_Loans
FROM loan;

-------------------------------------------------------------------------
                             #Date Analysis
-------------------------------------------------------------------------
   
#61.Find loans applied for in a particular year

SELECT *
FROM loan
WHERE EXTRACT(YEAR FROM Application_Date)='2026';

#62.Find loans approved during a particular month.

SELECT *
FROM loan
WHERE EXTRACT(MONTH FROM Approval_Date)=2;    #(February month)

#63.Find the number of loans applied for each year.

SELECT EXTRACT(YEAR FROM Application_Date) AS Application_Year,
       count(Loan_ID) AS Number_Of_Loans
FROM loan
GROUP BY  EXTRACT(YEAR FROM Application_Date);

#64.Find the total loan amount disbursed each year.

SELECT EXTRACT(YEAR FROM Disbursement_Date) AS Disbursement_Year,
	   SUM(Loan_Amount) AS Total_Loan_Amount
FROM loan
WHERE Loan_Status='Disbursed'
GROUP BY EXTRACT(YEAR FROM Disbursement_Date);

#65.Find customers whose loan was approved but not yet disbursed.

SELECT *
FROM loan
WHERE Loan_Status='Approved';

#66.Find the number of loans approved in each month.

SELECT MONTHNAME(Approval_Date) AS Approval_Month,
       count(Loan_ID)
FROM loan
WHERE Approval_Date IS NOT NULL
GROUP BY MONTHNAME(Approval_Date);

#67.Find the average number of days between application and approval.

SELECT AVG(DATEDIFF(Approval_Date,Application_Date)) AS AVG_Approval_Days
FROM loan
WHERE Approval_Date IS NOT NULL;

-------------------------------------------------------------------------
							#Subquery Challenges
-------------------------------------------------------------------------
  
#68.Find customers whose loan amount is greater than the average loan amount.

SELECT Customer_Name
FROM loan
WHERE Loan_Amount>(SELECT AVG(Loan_Amount) FROM loan);

#69.Find customers whose credit score is greater than the average credit score.

SELECT Customer_Name
FROM loan
WHERE Credit_Score>(SELECT AVG(Credit_Score) FROM loan);

#70.Find the customer who has taken the highest loan amount.

SELECT Customer_Name
FROM loan
WHERE Loan_Amount=(SELECT MAX(Loan_Amount) FROM loan);

#71.Find customers who have outstanding amount greater than the average outstanding amount.

SELECT Customer_Name
FROM loan
WHERE Outstanding_Amount>(SELECT AVG(Outstanding_Amount) FROM loan);

#72.Find the loan type having the highest total loan amount.

SELECT Loan_Type, SUM(Loan_Amount) AS Total_Loan_Amount
FROM loan
GROUP BY Loan_Type
HAVING SUM(Loan_Amount) = (
    SELECT MAX(Total_Amount)
    FROM (
        SELECT SUM(Loan_Amount) AS Total_Amount
        FROM loan
        GROUP BY Loan_Type
    ) AS T
);

#73.Find customers whose annual income is greater than the average annual income.

SELECT Customer_Name
FROM loan
WHERE Annual_Income>(SELECT AVG(Annual_Income) FROM loan);

-------------------------------------------------------------------------
                     #Advanced SQL — Top Management Questions
-------------------------------------------------------------------------
 
#74.Find the top 5 customers by total loan amount.

SELECT Customer_Name, Total_Loan_Amount
FROM (
    SELECT Customer_Name,
           SUM(Loan_Amount) AS Total_Loan_Amount,
           ROW_NUMBER() OVER (
               ORDER BY SUM(Loan_Amount) DESC
           ) AS rn
    FROM loan
    GROUP BY Customer_Name
) AS T
WHERE rn <= 5;

#75.Find the top 3 cities by total loan disbursement.

SELECT City, Total_Loan_Disbursement
FROM (
    SELECT City,
           SUM(Loan_Amount) AS Total_Loan_Disbursement,
           ROW_NUMBER() OVER(
               ORDER BY SUM(Loan_Amount) DESC
           ) AS rn
    FROM loan
    WHERE Loan_Status = 'Disbursed'
    GROUP BY City
) AS T
WHERE rn <= 3;   

#76.Find the top 3 loan types by outstanding amount.

SELECT Loan_Type, Total_Outstanding_Amount
FROM (
    SELECT Loan_Type,
           SUM(Outstanding_Amount) AS Total_Outstanding_Amount,
           ROW_NUMBER() OVER (
               ORDER BY SUM(Outstanding_Amount) DESC
           ) AS rn
    FROM loan
    GROUP BY Loan_Type
) AS T
WHERE rn <= 3;

#77.Find customers who have both:
   #• Credit score below 650
   #• Overdue amount greater than ₹50,000

SELECT Customer_Name, Credit_Score, Overdue_Amount
FROM loan
WHERE Credit_Score < 650
  AND Overdue_Amount > 50000;
  
#78.Identify customers whose loan amount is high compared with their annual income.
  
  SELECT Customer_Name,Annual_Income,Loan_Amount
  FROM loan
  WHERE Loan_Amount>Annual_Income;
  
#79.Identify customers who have multiple loans.

SELECT Customer_ID,Customer_Name,
       COUNT(Loan_ID) AS Loan_Count
FROM loan
GROUP BY Customer_ID, Customer_Name
HAVING COUNT(Loan_ID) > 1;

#80.Find customers whose previous loan is closed but who have another active loan.

SELECT DISTINCT l1.Customer_ID,
       l1.Customer_Name
FROM loan l1
WHERE l1.Loan_Status = 'Closed'
  AND EXISTS (
      SELECT 1
      FROM loan l2
      WHERE l2.Customer_ID = l1.Customer_ID
        AND l2.Loan_Status IN ('Approved', 'Disbursed')
        AND l2.Loan_ID <> l1.Loan_ID
  );

-------------------------------------------------------------------------  
                         #Final Business Challenge ⭐
-------------------------------------------------------------------------
   
/* Management has asked you to prepare a Loan Risk & Portfolio Analysis Report.
   Using SQL, answer the following questions:                                  */

##Portfolio

# How many total loans does the company have?

SELECT COUNT(*) AS Total_Loans
FROM loan;

# What is the total loan portfolio value?

SELECT SUM(Loan_Amount) AS Total_Loan_Portfolio
FROM loan;

# How much has been disbursed?

SELECT SUM(Loan_Amount) AS Total_Disbursed
FROM loan
WHERE Loan_Status = 'Disbursed';

# How much is still outstanding?

SELECT SUM(Outstanding_Amount) AS Total_Outstanding
FROM loan;

##Customer
  
# Which customers have the largest loans?

SELECT Customer_ID,Customer_Name,Loan_Amount
FROM loan
WHERE Loan_Amount=(SELECT MAX(Loan_Amount) FROM loan);

# Which cities generate the highest loan business?

SELECT City,SUM(Loan_Amount) AS Total_Loan_Business
FROM loan
GROUP BY City
ORDER BY Total_Loan_Business DESC;

# Which customer segments have the highest borrowing?

SELECT Employment_Type,SUM(Loan_Amount) AS Total_Borrowing
FROM loan
GROUP BY Employment_Type
ORDER BY Total_Borrowing DESC;

##Risk
    
# How many customers are High/Very High Risk?

SELECT COUNT(DISTINCT Customer_ID) AS High__Very_High_Risk_Customers
FROM loan
WHERE Credit_Score < 650;

# Which risk category has the highest outstanding amount?

SELECT
    CASE
        WHEN Credit_Score >= 750 THEN 'Low'
        WHEN Credit_Score >= 650 THEN 'Medium'
        WHEN Credit_Score >= 550 THEN 'High'
        ELSE 'Very High'
    END AS Risk_Category,
    SUM(Outstanding_Amount) AS Total_Outstanding
FROM loan
GROUP BY
    CASE
        WHEN Credit_Score >= 750 THEN 'Low'
        WHEN Credit_Score >= 650 THEN 'Medium'
        WHEN Credit_Score >= 550 THEN 'High'
        ELSE 'Very High'
    END
ORDER BY Total_Outstanding DESC
LIMIT 1;

#Which cities have the highest overdue amount?

SELECT City,
       SUM(Overdue_Amount) AS Total_Overdue
FROM loan
GROUP BY City
ORDER BY Total_Overdue DESC;

#How many customers are in default?

SELECT COUNT(DISTINCT Customer_ID) AS Default_Customers
FROM loan
WHERE Payment_Status = 'Default';

##Performance
   
# Which loan type is most popular?

SELECT Loan_Type,Loan_Count
FROM (
    SELECT Loan_Type,
           COUNT(Loan_ID) AS Loan_Count,
           DENSE_RANK() OVER (
               ORDER BY COUNT(Loan_ID) DESC
           ) AS rnk
     FROM loan
     GROUP BY Loan_Type
) AS T
WHERE rnk = 1;

# Which loan type generates the highest disbursement?

SELECT Loan_Type,
       SUM(Loan_Amount) AS Total_Disbursed
FROM loan
WHERE Loan_Status = 'Disbursed'
GROUP BY Loan_Type
ORDER BY Total_Disbursed DESC
LIMIT 1;


# Which loan type has the highest overdue amount?

SELECT Loan_Type,
       SUM(Overdue_Amount) AS Total_Overdue
FROM loan
GROUP BY Loan_Type
ORDER BY Total_Overdue DESC
LIMIT 1;

# What is the loan approval rate?

SELECT 
    ROUND(COUNT(CASE WHEN Loan_Status = 'Approved' THEN 1 END) * 100.0
    / COUNT(Loan_ID),2) AS Loan_Approval_Rate
FROM loan;
  














