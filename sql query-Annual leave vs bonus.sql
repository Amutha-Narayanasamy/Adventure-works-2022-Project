select  hre.JobTitle, 
	hre.VacationHours,  
	ssr.Bonus
from HumanResources.Employee hre
left join Sales.SalesPerson ssr on hre.BusinessEntityID = ssr.BusinessEntityID
where ssr.Bonus is not null
