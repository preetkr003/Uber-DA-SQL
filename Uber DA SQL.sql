Select *
From Bookings;

--1. Retrieve all successful bookings
Create View Successful_Bookings As
Select *
From Bookings
Where Booking_Status = 'Success';

--2. Find the average ride distance for each vehicle type:
Create View Average_Distance_PerVehicle AS
Select Vehicle_Type, Avg(Ride_Distance) AS Avg_Ride_Distance
From Bookings
Group By Vehicle_Type;


--3. Get the total number of cancelled rides by customers:
Create View Total_Cancel_Rides_By_Customers AS
Select Count(Booking_Id) AS Total_Cancelled_Rides
From Bookings
Where Booking_Status = 'Canceled by Customer';

--4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customers_Booking AS
Select Customer_Id, Count(Booking_Id) AS Total_Bookings
From Bookings
Group By Customer_Id
Order By Total_Bookings Desc
Limit 5;

--5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Cancel_By_Drivers_Personal_Issues AS
Select Count(Booking_Id) 
From Bookings
Where Canceled_Rides_by_Driver = 'Personal & Car related issue';

--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_DR_Prime_Sedan_Bookings AS
Select Max(Driver_Ratings), Min(Driver_Ratings)
From Bookings
Where Vehicle_Type = 'Prime_Sedan';

--7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payments AS
Select *
From Bookings
Where Payment_Method = 'UPI';

--8. Find the average customer rating per vehicle type:
Create View Avg_Customer_Rating_Per_Vehicle AS
Select Vehicle_Type, Avg(Customer_Rating)
From Bookings
Group By Vehicle_Type;

--9. Calculate the total booking value of rides completed successfully:
Create View Booking_Value_Ride_Successful AS
Select Sum(Booking_Value) AS Total_Value
From Bookings
Where Booking_Status = 'Success';

--10. List all incomplete rides along with the reason:
Create View All_Incomplete_Rides AS
Select Booking_Id, Incomplete_Rides_Reason
From Bookings
Where Incomplete_Rides = 'Yes';