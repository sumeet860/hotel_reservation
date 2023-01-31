select * from hotel_reservations;

-- There is a count of 0 adults who have booked the hotel.
-- It is an outlier as there is no adults.
select no_of_adults, count(*) from hotel_reservations
group by no_of_adults
order by no_of_adults desc;

-- Only 1 person had booked hotel with 10 children
-- there are 10, 9 children which is an outlier
select no_of_children, count(*) from hotel_reservations
group by no_of_children;

-- Maximum bookings are done in the month of October
select arrival_month, count(*) from hotel_reservations
group by arrival_month;

select no_of_weekend_nights, no_of_week_nights, count(*)
from hotel_reservations
group by no_of_weekend_nights
order by no_of_weekend_nights;

-- Many people does not require car parking space
select required_car_parking_space, count(*)
from hotel_reservations
group by required_car_parking_space;

-- maximum people have booked on 2nd of the month
select arrival_year, arrival_month, arrival_date, count(*)
from hotel_reservations
group by arrival_date;

select repeated_guest, count(*) from hotel_reservations
group by repeated_guest;

select no_of_previous_cancellations, count(*) from hotel_reservations
group by no_of_previous_cancellations;


