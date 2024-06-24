-- joining the two tables sales.store and Sales.vstoredemographics with BusinessEntityID
Select ss.SalesPersonID, 
	sd.BusinessEntityID, 
	sd.Name, sd.BusinessType, 
	sd.YearOpened, 
	sd. Specialty
  from Sales.Store ss
  join Sales.vStoreWithDemographics sd
  on ss.BusinessEntityID = sd.BusinessEntityID

-- joining the tables Sales_revenue and Sales.SalesOrderHeader with SalespersonID to get TotalDue to calculate Revenue.
select Distinct sr.BusinessEntityID as BusinessEntityID, 
	sr.Name as Shop_Name,  
	soh.SalesOrderID as SalesOrderID, 
	sum(soh.TotalDue) as Revenue, 
	sr.YearOpened, sr.BusinessType, 
	sr.Specialty
from Sales.SalesOrderHeader soh
join sales_revenue sr
on soh.SalesPersonID = sr.SalesPersonID
Group By BusinessEntityID,SalesOrderID,
	sr.YearOpened,  
	sr.Name,sr.BusinessType,
	sr.Specialty
Order by Revenue desc;


-- to get unique row number for each BusinessEntityID, 
WITH CTE AS (
	SELECT
    	sr.BusinessEntityID,
    	sr.Name AS Shop_Name,
    	soh.SalesOrderID,
    	soh.TotalDue,
    	sr.YearOpened,
    	sr.BusinessType,
    	sr.Specialty,
    	ROW_NUMBER() OVER (PARTITION BY sr.BusinessEntityID ORDER BY soh.SalesOrderID) AS row_num
	FROM
    	Sales.SalesOrderHeader soh
	JOIN
    	sales_revenue sr
    	ON soh.SalesPersonID = sr.SalesPersonID
)
SELECT
	BusinessEntityID,
	Shop_Name,
	SalesOrderID AS SalesOrderID,
	AVG(TotalDue) AS Revenue,
	YearOpened,
	BusinessType,
	Specialty
FROM
	CTE
WHERE
	row_num = 1
GROUP BY
	BusinessEntityID,
	Shop_Name,
	YearOpened,
	BusinessType,
	Specialty,SalesOrderID
 
