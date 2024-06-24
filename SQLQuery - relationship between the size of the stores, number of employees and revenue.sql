SELECT S.Name, 
	S.SquareFeet AS Size, 
	S.NumberEmployees, 
	S.AnnualRevenue
FROM Sales.vStoreWithDemographics as S
ORDER BY Size;
