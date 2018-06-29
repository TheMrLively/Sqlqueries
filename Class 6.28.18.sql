--Class 6.28.18

--Code Along
SELECT userid, referred_by
FROM da_readychef.users u 
LEFT JOIN da_readychef.referrals r ON u.userid = r.referred

--LEFT OUTER JOIN 
SELECT DISTINCT COUNT (customers.id)
FROM da_sales.customers 
LEFT JOIN da_sales.purchases ON customers.id = custid

--JOINS with more than two tables 
SELECT customers.name, products.name
FROM da_sales.purchases 
LEFT JOIN da_sales.customers ON custid = customers.id
LEFT JOIN da_sales.products ON prodid = products.id
