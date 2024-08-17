/*Showing the number of restaurants across both the cities and 
the average rating of all restaurants combined.*/
select distinct count(restaurant_name), 
avg(rating) as avg_rating, city from swiggy 
group by city order by avg_rating desc;

/* Showing the count for restaurants that have a rating >= 4
across both the cities */
select distinct count(restaurant_name) 
as res_count, city from swiggy 
where rating >= 4 group by city 
order by res_count desc;

/* Showing the count for restaurants that have a rating <= 3 
 and <3 across both the cities */
select distinct count(restaurant_name) 
as res_count, city from swiggy where rating <= 3 group by city 
order by res_count;

select distinct 
count(restaurant_name) as res_count, city from swiggy 
where rating < 3 group by city order by res_count;

/* Showing top 10 resturants from both the cities*/
select restaurant_name, city, 
avg(rating) as avg_rating 
from swiggy group by restaurant_name, 
city order by avg_rating desc limit 10;

/* Showing the average cost per person required for 
restaurant services in both cities */

select distinct city, avg(cost_per_person) 
as avg_cst_pp from swiggy group by city 
order by avg_cst_pp desc; 

/*Showing the realtion between average cost 
per person and the average rating*/

 SELECT 
    COUNT(restaurant_name) AS restaurant_count, 
    AVG(cost_per_person) AS avg_cost,
    AVG(rating) AS avg_rating, city
FROM swiggy
where city = 'Ahmedabad'
GROUP BY cost_per_person, city
ORDER BY AVG(rating) DESC;


SELECT 
    COUNT(restaurant_name) AS restaurant_count, 
    AVG(cost_per_person) AS avg_cost,
    AVG(rating) AS avg_rating, city
FROM swiggy
where city = ‘Bangalore’
GROUP BY cost_per_person, city
ORDER BY AVG(rating) DESC;

/* Showing the number of
restaurants that have 
cost_per_person > the 
mean average cost of all
restaurants */

SELECT COUNT(restaurant_name) 
AS restaurant_count FROM swiggy 
WHERE cost_per_person > 
(SELECT AVG(cost_per_person) FROM swiggy);

/* Showing the list of same restaurents*/

select distinct restaurant_name, 
cost_per_person from swiggy 
where cost_per_person > 
(select avg(cost_per_person) from swiggy);

/* showing the restaurants that have PIZZA in their names*/
select count(distinct restaurant_name) 
as pizzas from swiggy where 
restaurant_name 
like '%pizza%' or '%PIZZA%' ;

/* Showing reataurants that do not 
have Indian cuisine in their menue*/
select distinct restaurant_name, 
cost_per_person, cuisine from swiggy 
where cuisine not like '%Indian%' 
order by cost_per_person desc;

/* Total number of restaurants which 
do not have Indian cuisine*/

SELECT  COUNT(*) 
AS total_restaurants 
FROM swiggy WHERE cuisine 
NOT LIKE '%Indian%';

/* Showing the restaurents
with same name but located
in different cities*/

select distinct t1.restaurant_name, t1.city,t2.city
from swiggy t1 join swiggy t2 
on t1.restaurant_name=t2.restaurant_name 
and t1.city<>t2.city;

/* Which restaurants offer the most number
of items in their main course */

select distinct restaurant_name, menu_category, 
count(item) as no_of_item, 
avg(cost_per_person) as avg_cost
from swiggy
where menu_category='Main Course'
group by restaurant_name, menu_category
order by no_of_item desc limit 1;

/* List of restaurants that are vegetarians in
alphabetical order */

select distinct restaurant_name, (count(case when veg_or_nonveg='Veg' then 1 end)*100/
count(*)) as vegetarian_percentage from swiggy group by restaurant_name
having vegetarian_percentage=100.00
order by restaurant_name;

/* Restaurant providing the lowest average price of all items*/

select distinct restaurant_name, avg(price) as avg_price 
from swiggy group by restaurant_name order by avg_price limit 1;

/* Restaurant providing the highest average price of all items*/
select distinct restaurant_name, avg(price) as avg_price 
from swiggy group by restaurant_name order by avg_price desc limit 1;

/* Top 5 restaurants offering the highest number of categories*/

select distinct restaurant_name, count(distinct menu_category) 
as no_of_categories from swiggy group by restaurant_name 
order by no_of_categories desc limit 5;

/* restaurant providing the highest 
percentage of non-vegetarian food*/

select distinct restaurant_name, 
(count(case when veg_or_nonveg='Non-veg' then 1 end )*100) / 
count(*) as nonvegetarian_percentage from swiggy   
group by restaurant_name order by nonvegetarian_percentage 
desc limit 1;

/* The most common cuisine among the restaurents*/

select  cuisine, count(*) as cuisine_count 
from swiggy group by cuisine order by 
cuisine_count desc limit 1;

