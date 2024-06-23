select ST.CountryRegionCode as Country, 
	CAST(ROUND(SUM(SOD.LineTotal), 0) as int) as Total_sales_Revenue, 
	Year(convert(DATE, SOD.ModifiedDate)) as Date
from sales.SalesOrderDetail SOD
join Sales.SalesOrderHeader SOH 
on SOD.SalesOrderID = SOH.SalesOrderID
join Sales.SalesTerritory ST 
on SOH.TerritoryID = ST.TerritoryID
group by ST.CountryRegionCode, YEAR(CONVERT(DATE, SOD.ModifiedDate));
 
