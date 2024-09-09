create database walmart_sales;
use walmart_sales;
CREATE TABLE IF NOT EXISTS walmartdata(
	Invoice_ID VARCHAR(30) NOT NULL PRIMARY KEY,
    Branch VARCHAR(5) NOT NULL,
    City VARCHAR(30) NOT NULL,
    Customer_type VARCHAR(30) NOT NULL,
    Gender VARCHAR(30) NOT NULL,
    Product_line VARCHAR(100) NOT NULL,
    Unit_price DECIMAL(10,2) NOT NULL,
    Quantity INT NOT NULL,
    Tax_5% FLOAT(6,4) NOT NULL,
    Total DECIMAL(12, 4) NOT NULL,
    Date DATETIME NOT NULL,
    Time TIME NOT NULL,
    Payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_percentage FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    Rating FLOAT(2, 1)
);
select * from walmartdata;
-- Q.1) Retrieve all columns for sales made in a specific branch (e.g., Branch 'A').
		SELECT * FROM walmartdata WHERE Branch = "A";
        
-- Q.2) Find the total sales for each product line.
        SELECT Product_line, SUM(Total) AS Total_Sales
		FROM walmartdata
		GROUP BY Product_line;
	
-- Q.3) List all sales transactions where the payment method was 'Cash'.
		SELECT *
		FROM walmartdata
		WHERE Payment = 'Cash';
	
-- Q. 4) Calculate the total gross income generated in each city. 
		SELECT City, SUM(gross_income) AS Total_Gross_Income
		FROM walmartdata
		GROUP BY City;

-- Q.5) Find the average rating given by customers in each branch. 
		SELECT Branch, AVG(Rating) AS Average_Rating
		FROM walmartdata
		GROUP BY Branch;

-- Q.6) Determine the total quantity of each product line sold.
		SELECT Product_line, SUM(Quantity) AS Total_Quantity_Sold
		FROM walmartdata
		GROUP BY Product_line;
        
-- Q.7) List the top 5 products by unit price. 
		SELECT Product_line, Unit_price
		FROM walmartdata
		ORDER BY Unit_price DESC
		LIMIT 5;

-- Q.8) Find sales transactions with a gross income greater than 30. 
		SELECT *
		FROM walmartdata
		WHERE gross_income > 30;
        
-- Q.9) Retrieve sales transactions that occurred on weekends.
		SELECT *
		FROM walmartdata
		WHERE DAYOFWEEK(Date) IN (1, 7);
        
-- Q.10) Calculate the total sales and gross income for each month. 
			SELECT 
			YEAR(Date) AS Year, 
			MONTH(Date) AS Month, 
			SUM(Total) AS Total_Sales, 
			SUM(gross_income) AS Total_Gross_Income
			FROM walmartdata
			GROUP BY YEAR(Date), MONTH(Date)
			ORDER BY Year, Month;
            
-- Q.11) Find the number of sales transactions that occurred after 6 PM.
		SELECT COUNT(*) AS Number_of_Transactions
		FROM walmartdata
		WHERE Time > '18:00:00';
        
-- Q. 12) List the sales transactions that have a higher total than the average total of all transactions.
		SELECT *
		FROM walmartdata
		WHERE Total > (
		SELECT AVG(Total)
		FROM walmartdata
		);

-- Q.13) Calculate the cumulative gross income for each branch by date. 
				SELECT 
				Branch, 
				Date, 
				SUM(gross_income) OVER (PARTITION BY Branch ORDER BY Date) AS Cumulative_Gross_Income
				FROM walmartdata
				ORDER BY Branch, Date;

-- Q.14) Find the total cogs for each customer type in each city.
		SELECT 
		City, 
		Customer_type, 
		SUM(cogs) AS Total_COGS
		FROM walmartdata
		GROUP BY City, Customer_type;















