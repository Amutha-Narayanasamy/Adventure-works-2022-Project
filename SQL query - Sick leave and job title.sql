Select HRE.JobTitle,
	HS.Name as Shift_Name, 
	pp.PersonType,
	isnull(HRE.OrganizationLevel, 1) as OrganizationLevel, 
	Avg(HRE.SickLeaveHours) as avg_sickleavehours
from HumanResources.Employee HRE
-- Joining the humanresources.empolymenthistory table with buisneesentityID
Join HumanResources.EmployeeDepartmentHistory EDH
on HRE.BusinessEntityID = EDH.BusinessEntityID
join Person.Person pp 
on EDH.BusinessEntityID = pp.BusinessEntityID
-- Joining the table Humanresourcesshift table with shift id to get the shif name
join HumanResources.Shift HS
on EDH.ShiftID=HS.ShiftID
Group by HS.Name, HRE.JobTitle, OrganizationLevel, pp.PersonType
 

-- Grouping the vvalues based on Person type - Employee, Sales person
 select PersonType, OrganizationLevel, avg_sickleavehours, Shift_Name
From Sickleave_jobTitle
group by PersonType, OrganizationLevel, Shift_Name, avg_sickleavehours
 
