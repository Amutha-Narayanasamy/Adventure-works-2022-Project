Select soh.TerritoryID, 
	st.Name, st.CountryRegionCode, 
	SUM(Soh.TotalDue) AS Total_Sales, 
	MAX(soh.OrderDate) AS LatestOrderDate
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesTerritory st 
ON soh.TerritoryID = st.TerritoryID
Group BY soh.TerritoryID, st.Name, st.CountryRegionCode
Order by Total_Sales DESC

