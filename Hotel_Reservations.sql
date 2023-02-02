use credit_card;
select * from hotel_reservations;

-- 36275 are total booking data
select count(*) from hotel_reservations;

-- 11885 people have canceled the booking
select count(*) from hotel_reservations
where booking_status = 'Canceled';

-- 24390 people have not canceled the  booking
select count(*) from hotel_reservations
where booking_status = 'Not_Canceled';

-- There are no repeated guest
select repeated_guest, count(*) from hotel_reservations
group by repeated_guest;

-- No one needed the parking space
select required_car_parking_space, count(*) from hotel_reservations
group by required_car_parking_space;

-- Max people have made no special requests was made
select No_of_special_requests, count(*) from hotel_reservations
group by No_of_special_requests;

-- 4 people have made previous cancellation 13 times
-- IT IS AN OUTLIER AS THESE MANY CANCELLATION IS NOT POSSIBLE
select no_of_previous_cancellations, count(*) from hotel_reservations
group by no_of_previous_cancellations
order by no_of_previous_cancellations desc;

-- There is an increase in hotel booking compared to year 2018
select arrival_year, count(booking_status) from hotel_reservations
group by arrival_year;

select arrival_year, count(booking_status) from hotel_reservations
group by arrival_year;

-- 23247 is increased in booking.
with cte_arrival as (select (select count(booking_status) booking_18
from hotel_reservations
where arrival_year=2018) year_18,
(select count(booking_status) from hotel_reservations
where arrival_year = 2017) year_17)
select year_18, year_17, year_18-year_17 as increase_booking
from cte_arrival;

-- Meal Plan 1 was ordered maximum 27835.
-- There are only 5 people who have ordered Meal Plan 3.
-- It shows that Meal Plan 3 is not good or the taste of food is not good.
select type_of_meal_plan, count(type_of_meal_plan) from hotel_reservations
group by type_of_meal_plan;

-- Room_Type 1 was booked maximum by 28130.
-- Room_Type 3 was booked only by 7 people.
-- This shows that the Room is not good or the room type 3 does not provide all the facilities
-- as compared to another rooms. 
select room_type_reserved, count(room_type_reserved) from hotel_reservations
group by room_type_reserved;


-- Cancellation is less compared to not cancel.
with booking as (select
(select count(booking_status) from hotel_reservations
where arrival_year=2017) as total_count_17,
(select count(booking_status) from hotel_reservations 
where booking_status = 'Not_Canceled' and arrival_year=2017) as Not_Canceled_17,
(select count(booking_status) from hotel_reservations 
where booking_status = 'Canceled' and arrival_year=2017) as Canceled_17,
(select count(booking_status) from hotel_reservations
where arrival_year=2018) as total_count_18,
(select count(booking_status) from hotel_reservations 
where booking_status = 'Not_Canceled' and arrival_year=2018) as Not_Canceled_18,
(select count(booking_status) from hotel_reservations 
where booking_status = 'Canceled' and arrival_year=2018) as Canceled_18)
select total_count_17, Not_Canceled_17, Canceled_17, total_count_18, Not_Canceled_18, Canceled_18 from booking;
