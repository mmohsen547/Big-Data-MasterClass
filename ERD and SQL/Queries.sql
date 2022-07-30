--Homework 1
SELECT e.FirstName AS Employee_FirstName, e.LastName AS Employee_LastName, COUNT(o.orderID) AS Number_of_orders 
FROM Employees e, Orders o
WHERE o.EmployeeID = e.EmployeeID
group by e.FirstName, e.LastName
ORDER BY Number_of_orders DESC
LIMIT 10

--Homework2
SELECT e.FirstName AS Employee_FirstName, e.LastName AS Employee_LastName, SUM(Quantity) AS Total_Quantity
From Employees e, Orders O, OrderDetails d, Categories c, Products p
where c.CategoryName = "Beverages" and p.CategoryID = c.CategoryID and
p.ProductID = d.ProductID and d.OrderID = o.OrderID
and e.EmployeeID = o.EmployeeID
group by e.FirstName, e.LastName
order by Total_Quantity DESC
LIMIT 10;