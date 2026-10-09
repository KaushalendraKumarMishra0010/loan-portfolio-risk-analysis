# <strong style="font-weight: 800; font-size: 28px; color: #000000;">Loan Portfolio & Risk Analysis System</strong>

An end-to-end <strong style="font-weight: 700; color: #000000;">SQL-based analytics system</strong> designed to evaluate loan portfolio performance, assess credit risk, monitor disbursements, track overdue balances, and compute key financial business metrics. 

This project covers database design, schema creation, data ingestion, and over 80 comprehensive analytical queries scaling from basic filtering to advanced subqueries and window functions.

---

## <strong style="font-weight: 700; font-size: 22px; color: #000000;">📌 Business Problem Statement</strong>

As a financial institution's loan portfolio expands, the risk management and executive teams require a centralized data-driven framework to monitor operational health. This system answers critical business queries, including:
* <strong style="font-weight: 700; color: #000000;">Product Optimization:</strong> Which loan products generate the highest business value?
* <strong style="font-weight: 700; color: #000000;">Financial Exposure:</strong> What is the current financial exposure (outstanding vs. overdue balances)?
* <strong style="font-weight: 700; color: #000000;">Credit Risk Assessment:</strong> Which customer profiles and geographical regions present the highest credit risk?
* <strong style="font-weight: 700; color: #000000;">Operational Performance:</strong> How are operational KPIs (such as approval and rejection rates) tracking over time?

---

## <strong style="font-weight: 700; font-size: 22px; color: #000000;">🛠️ Tech Stack & Concepts Covered</strong>

* <strong style="font-weight: 700; color: #000000;">Database Engine:</strong> MySQL Compatible
* <strong style="font-weight: 700; color: #000000;">SQL Mechanics:</strong> Data Definition Language (DDL), Data Manipulation Language (DML)
* <strong style="font-weight: 700; color: #000000;">Aggregations:</strong> Multi-dimensional grouping using `GROUP BY` and filtering with `HAVING`
* <strong style="font-weight: 700; color: #000000;">Conditional Logic:</strong> Advanced business mapping using `CASE WHEN` statements
* <strong style="font-weight: 700; color: #000000;">Temporal Analytics:</strong> Dynamic date metrics via `DATEDIFF`, `EXTRACT`, and `MONTHNAME`
* <strong style="font-weight: 700; color: #000000;">Advanced Architecture:</strong> Nested Subqueries and Window Functions (`ROW_NUMBER`, `DENSE_RANK`)

---

## <strong style="font-weight: 700; font-size: 22px; color: #000000;">📂 Repository Layout</strong>

* 📁 <strong style="font-weight: 700; color: #000000;">loan-risk-analysis/</strong>
  * 📄 <strong style="font-weight: 700; color: #000000;">`loan_dataset_setup.sql`</strong> (Database creation, table definitions, constraints, and data population)
  * 📄 <strong style="font-weight: 700; color: #000000;">`loan_analytical_queries.sql`</strong> (80+ organized production business queries and solutions)

---

## <strong style="font-weight: 700; font-size: 22px; color: #000000;">🗄️ Database Architecture & Constraints</strong>

The system relies on a highly constrained <strong style="font-weight: 700; color: #000000;">`LOAN` table</strong> built inside `loan_dataset_setup.sql` to maintain absolute data integrity across financial tracking metrics:

```sql
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
    Loan_Type VARCHAR(20) CHECK (Loan_Type IN ('Home', 'Personal', 'Car', 'Education', 'Business')),
    Loan_Amount DECIMAL(12,2) CHECK (Loan_Amount > 0),
    Interest_Rate DECIMAL(5,2) CHECK (Interest_Rate > 0),
    Loan_Term INT,
    Application_Date DATE,
    Approval_Date DATE,
    Disbursement_Date DATE,
    Loan_Status VARCHAR(20) CHECK (Loan_Status IN ('Applied', 'Approved', 'Rejected', 'Disbursed', 'Closed')),
    Credit_Score INT CHECK (Credit_Score BETWEEN 300 AND 900),
    Monthly_EMI DECIMAL(10,2),
    Amount_Paid DECIMAL(12,2),
    Outstanding_Amount DECIMAL(12,2),
    Overdue_Amount DECIMAL(12,2),
    Payment_Status VARCHAR(20) CHECK (Payment_Status IN ('Paid', 'Pending', 'Overdue', 'Default'))
);
```

---

## <strong style="font-weight: 700; font-size: 22px; color: #000000;">🚀 Analysis Roadmap & Query Portfolio</strong>

The analytical framework inside `loan_analytical_queries.sql` contains <strong style="font-weight: 700; color: #000000;">80+ organized SQL problem-solving queries</strong> divided into logical progression tiers mirroring institutional reporting standards:

### <strong style="font-weight: 700; font-size: 18px; color: #000000;">1. Basic SQL Analysis</strong>
General data extraction, filtering specific variables, and evaluating unique demographic traits.
* Extracting target product lines (e.g., all `Personal Loan` records).
* Isolating accounts based on target geography (`City = 'Delhi'`).

```sql
SELECT Customer_Name FROM loan WHERE Loan_Type = 'Personal';
SELECT Customer_Name FROM loan WHERE City = 'Delhi';
```

### <strong style="font-weight: 700; font-size: 18px; color: #000000;">2. Filtering & Sorting</strong>
Tracking top-tier loan bounds, target age intervals, wildcards, and state exclusions.
* Segmenting young-to-mid career borrowers between the ages of <strong style="font-weight: 700; color: #000000;">25 and 40</strong>.
* Filtering out clusters outside specific operational hubs (e.g., `State != 'Maharashtra'`).

```sql
SELECT * FROM loan WHERE Age BETWEEN 25 AND 40;
SELECT * FROM loan WHERE State != 'Maharashtra';
```

### <strong style="font-weight: 700; font-size: 18px; color: #000000;">3. Aggregate Analysis</strong>
Global operational summary metrics highlighting overall ecosystem volumes and absolute financial limits.
* Total capital asset value requested vs. actual volumes deployed out to borrowers.
* System-wide averages for borrowing parameters like interest margins and baseline risk points.

```sql
SELECT SUM(Loan_Amount) AS Total_Loan_Amount_Requested FROM loan;
SELECT AVG(Interest_Rate) AS Average_Interest_Rate FROM loan;
```

### <strong style="font-weight: 700; font-size: 18px; color: #000000;">4. Pile Sorting (GROUP BY Analysis)</strong>
This section organizes the bank's total money and records by sorting them into separate categories to see counts and totals.
* Counting how many total loans exist for each <strong style="font-weight: 700; color: #000000;">individual product type</strong> (like Home Loans or Car Loans).
* Grouping customer records together by their <strong style="font-weight: 700; color: #000000;">home states</strong> or <strong style="font-weight: 700; color: #000000;">job types</strong> to see who borrows the most money.

```sql
SELECT Loan_Type, COUNT(Loan_Type) AS Number_Of_Loans 
FROM loan GROUP BY Loan_Type;
```

### <strong style="font-weight: 700; font-size: 18px; color: #000000;">5. Advanced Refinements (HAVING Clause)</strong>
Isolating group clusters that break past predefined institutional risk or demand trigger values.
* Finding high-performing municipal markets generating over ₹50 Lakh in active payouts.
* Pinpointing highly distressed sectors with overdue totals tracking above ₹1 Lakh.

```sql
SELECT City, SUM(Overdue_Amount) AS Total_Overdue_Amount
FROM loan GROUP BY City HAVING SUM(Overdue_Amount) > 100000;
```

### <strong style="font-weight: 700; font-size: 18px; color: #000000;">6. Dynamic Risk Classification (CASE Statement)</strong>
Labeling customers automatically based on their raw credit score numbers:

| Credit Score Range | Risk Category Assignation | Portfolio Management Action |
| :--- | :--- | :--- |
| **750 and Above** | **Low Risk** | Auto-Approval Target Pipeline |
| **650 to 749** | **Medium Risk** | Standard Collateral Evaluation |
| **550 to 649** | **High Risk** | Manual Underwriting Review |
| **Below 550** | **Very High Risk** | Strict Rejection Protocol |

```sql
SELECT Customer_Name, Credit_Score,
    CASE 
       WHEN Credit_Score >= 750 THEN 'Low Risk'
       WHEN Credit_Score BETWEEN 650 AND 749 THEN 'Medium Risk'
       WHEN Credit_Score BETWEEN 550 AND 649 THEN 'High Risk'
       ELSE 'Very High Risk' 
     END AS Risk_category
FROM loan;
```

### <strong style="font-weight: 700; font-size: 18px; color: #000000;">7. Core Performance Metrics (KPIs)</strong>
Automated calculations tracking core institutional health, portfolio leakages, and asset pipeline flow metrics.
* <strong style="font-weight: 700; color: #000000;">Loan Approval Rate:</strong> Tracks system-wide processing efficiency.
* <strong style="font-weight: 700; color: #000000;">Percentage of Overdue Loans:</strong> Quantifies toxic account penetration rates.

```sql
-- Loan Approval Rate Calculation
SELECT COUNT(CASE WHEN Loan_Status = 'Approved' THEN 1 END) * 100.0 / COUNT(Loan_ID) AS Loan_Approval_Rate FROM loan;

-- Overdue Portfolio Percentage Calculation
SELECT COUNT(CASE WHEN Payment_Status = 'Overdue' THEN 1 END) * 100.0 / COUNT(Loan_ID) AS Percentage_Of_Overdue_Loans FROM loan;
```

### **8. Time & Date Tracking**
Looking at dates to see which months are the busiest or calculating how many days it takes for a loan to get approved.
* **Application Trends:** Checking how the number of loan applications grows over months and years.
* **Processing Speeds:** Measuring the bank's operational speed by counting the exact number of days between a customer applying and getting approved.

```sql
SELECT AVG(DATEDIFF(Approval_Date, Application_Date)) AS AVG_Approval_Days 
FROM loan 
WHERE Approval_Date IS NOT NULL; 
```

### **9. Smart Subqueries**
Nesting execution blocks to isolate customer records that surpass dynamically calculated corporate averages.
* **Above-Average Borrowers:** Filtering for individual accounts maintaining debt sizes higher than the running portfolio mean.
* **Top Product Ingestion:** Identifying the specific loan category responsible for anchoring the highest capital demand.

```sql
SELECT Customer_Name 
FROM loan  
WHERE Loan_Amount > (SELECT AVG(Loan_Amount) FROM loan); 
```

### **10. Advanced Top Management Analytics (Window Functions)**
Utilizing high-performance analytical partitioning mechanics to run complex ranking arrays required for executive status reviews.

```sql
SELECT City, Total_Loan_Disbursement 
FROM ( 
    SELECT City, SUM(Loan_Amount) AS Total_Loan_Disbursement, 
           ROW_NUMBER() OVER(ORDER BY SUM(Loan_Amount) DESC) AS rn 
    FROM loan 
    WHERE Loan_Status = 'Disbursed' 
    GROUP BY City 
) AS T 
WHERE rn <= 3; 
```

---

## **📊 11. Final Executive Summary Report**

Instead of reading 80 separate query windows, this section acts as a simple summary page for management. Based on the 20 sample rows in the database, here are the real project results:

### **🏢 Overall Numbers**
* **Total Applications:** 20 active loans tracked.
* **Total Portfolio Value:** **₹4,51,00,000** total money dealt with.
* **Total Handed Out (Disbursed):** **₹3,88,00,000** passed to customers.
* **Total Active Debt (Outstanding):** **₹3,63,00,000** still left to be paid back.

### **🎯 Market Trends**
* **Busiest Cities:** **Delhi** and **Mumbai** bring in the most customer applications.
* **Biggest Borrowers:** **Salaried workers** take out the most loans.
* **Most Popular Product:** **Home Loans** take up the largest amount of the bank's capital.

### **⚠️ Bad News & Money Risks**
* **Total Late Payments (Systemic Delinquency):** **₹5,40,000** is currently overdue because customers missed their deadlines (calculated via the sum of all accounts with missed payment deadlines).
* **Total Defaulters:** **2 customers** have completely stopped paying their loans (Amit Sharma and Sameer Khan).
* **Riskiest Cities:** **Mumbai** and **Chennai** have the highest late payment amounts.

---

## **🚀 Step-by-Step Setup Guide**

Follow these three basic steps to run this project on your computer:

* **Step 1: Open Your Database Tool** — Open your SQL database software, such as **MySQL Workbench** or **DBeaver**.
* **Step 2: Build the Database and Insert Data** — Download the `loan_dataset_setup.sql` file, open it inside your database software, and click the Lightning Bolt (⚡) execute button. This automatically creates the database structure and fills it with the 20 customer records.
* **Step 3: Run the Business Reports** — Download the `loan_analytical_queries.sql` file, open it in a new tab inside your database software, and click the Lightning Bolt (⚡) execute button. The software runs all 80+ queries from top to bottom and shows you all the answers in the results panel instantly.

