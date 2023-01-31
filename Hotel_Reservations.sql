use credit_card;
select * from hotel_reservations;

-- 36275 are total booking data
select count(*) from hotel_reservations;

-- 11885 people have not canceled
select count(*) from hotel_reservations
where booking_status = 'Canceled';

-- 24390 people have not canceled
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

-- No one previously cancelled
select no_of_previous_bookings_not_canceled, count(*) from hotel_reservations;

-- Only 1 person had booked hotel with 10 children
-- there are 10, 9 children which is an outlier
select no_of_children, count(*) from hotel_reservations
group by no_of_children;


