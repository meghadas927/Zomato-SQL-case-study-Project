create database Case_study7;
use Case_study7;
select * from country;
select * from zomato;

-- Business Questions: 
-- 1) Help Zomato in identifying the cities with poor Restaurant ratings

select city,Avg(Rating)
from zomato
group by city
order by 2 asc;

-- 2) Mr.roy is looking for a restaurant in kolkata which provides online delivery. Help him choose the best restaurant.

select city,RestaurantID,Res_identify,Rating,Has_online_delivery
from zomato
where city ="kolkata" and Has_online_delivery = "yes" and Rating>4;


-- 3) Help Peter in finding the best rated Restraunt for Pizza in New Delhi.

select city,RestaurantID,Res_identify,Cuisines,Rating
from zomato
where city ="New Delhi" and Cuisines = "Pizza"
order by 5 desc
limit 1;

-- 4)Enlist most affordable and highly rated restaurants city wise.

select city,RestaurantID,Res_identify,Rating,price_range
from zomato
where price_range between 1 and 2 and Rating>4.5
order by 1,4 desc;


-- 5)Help Zomato in identifying the restaurants with poor offline services

select city,RestaurantID,Has_Online_delivery,Has_Table_booking,Rating
from zomato
where Has_Online_delivery= "No" and Rating <=2 and Has_Table_booking="yes";


-- 6)Help zomato in identifying those cities which have atleast 3 restaurants with ratings >= 4.9
-- In case there are two cities with the same result, sort them in alphabetical order.

select city,count(RestaurantID) as NO_of_Restaurant
from zomato
where Rating>=4.9
group by city
having count(RestaurantID)=3
order by 1 asc, 2 desc;

-- 7) What are the top 5 countries with most restaurants linked with Zomato?

SELECT c.country,count(*) as No_of_Restaurant
FROM zomato z inner join country c using (CountryCode)
group by c.country
order by 2 desc
limit 5;


-- 8) What is the average cost for two across all Zomato listed restaurants? 

select Average_Cost_for_two,count(*) as Total_count
From zomato
group by Average_Cost_for_two
order by 1 desc;

-- 9) Group the restaurants basis the average cost for two into: 
-- Luxurious Expensive, Very Expensive, Expensive, High, Medium High, Average. 
-- Then, find the number of restaurants in each category. 

select
case 
When Average_Cost_for_two > 20000 then "Luxurious Fooding"
        When Average_Cost_for_two between 15000 and 20000 then "Ultra Expensive"
        When Average_Cost_for_two between 10000 and 14999 then "Very Expensive"
        When Average_Cost_for_two between 5000 and 9999 then "Expensive"
        When Average_Cost_for_two between 1000 and 4999 then "High"
        When Average_Cost_for_two between 500 and 999 then "Medium high"
		Else "Average"
        end as Price_Category, Count(*) as Total_count
        from zomato
group by case 
When Average_Cost_for_two > 20000 then "Luxurious Fooding"
        When Average_Cost_for_two between 15000 and 20000 then "Ultra Expensive"
        When Average_Cost_for_two between 10000 and 14999 then "Very Expensive"
        When Average_Cost_for_two between 5000 and 9999 then "Expensive"
        When Average_Cost_for_two between 1000 and 4999 then "High"
        When Average_Cost_for_two between 500 and 999 then "Medium high"
		Else "Average"
        end
        order by 2 desc;
        
        
-- 10) List the two top 5 restaurants with highest rating with maximum votes. 

select RestaurantID,Res_identify,Rating,Votes
from zomato
order by 4 desc,3 desc
limit 5;






