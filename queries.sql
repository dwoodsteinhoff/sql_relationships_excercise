-- write your queries here

-- 1. Join the two tables so that every column and record appears, regardless of if there is not an owner_id. 

SELECT * FROM owners o
FULL JOIN vehicles v
ON v.owner_id = o.id;

-- 2. Count the number of cars for each owner. Display the owners first_name, last_name and count of vehicles. The first_name should be ordered in ascending order

SELECT o.first_name,o.last_name, COUNT(*) AS count 
FROM owners o 
JOIN vehicles v 
ON v.owner_id = o.id 
GROUP BY o.first_name,o.last_name 
ORDER BY count; 

-- 3. Count the number of cars for each owner and display the average price for each of the cars as integers. Display the owners first_name, last_name, average price and count of vehicles. The first_name should be ordered in descending order. Only display results with more than one vehicle and an average price greater than 10000.

SELECT o.first_name,o.last_name, COUNT(*) AS count, AVG(price) AS average_price FROM owners o 
JOIN vehicles v 
ON v.owner_id = o.id 
GROUP BY o.first_name,o.last_name 
HAVING COUNT(*) > 1 
AND AVG(price) > 10000 
ORDER BY count DESC;