# Database Advanced Scripts

This directory contains SQL scripts to practice **advanced queries with joins** in the AirBnB database.

## Files

- `joins_queries.sql` – Contains SQL queries demonstrating:
  - **INNER JOIN**: Retrieve all bookings with the users who made them (`Booking.user_id = User.user_id`).
  - **LEFT JOIN**: Retrieve all properties with their reviews, including properties that have no reviews (`Property.property_id = Review.property_id`).
  - **FULL OUTER JOIN**: Retrieve all users and all bookings, even if a user has no booking or a booking is not linked to a user (`User.user_id = Booking.user_id`).

- `README.md` – This file.

## Tables and Columns Used

- **User**: `user_id`, `first_name`, `last_name`, `email`
- **Property**: `property_id`, `host_id`, `name`
- **Booking**: `booking_id`, `property_id`, `user_id`, `status`
- **Review**: `review_id`, `property_id`, `user_id`, `rating`, `comment`
message &review


## Objective

- Practice writing complex SQL queries using joins.
- Retrieve related data across multiple tables.
- Understand how to handle missing or unmatched data using different join types.



## Subqueries Practice

File: subqueries.sql

Objective: Practice writing correlated and non-correlated subqueries.

Queries:
- Find properties where the average rating is greater than 4.
- Find users who have made more than 3 bookings.

## Subqueries Practice
File: subqueries.sql
Objective: Practice writing correlated and non-correlated subqueries.
Queries:
- Find properties where the average rating is greater than 4.
- Find users who have made more than 3 bookings.


## Aggregations and Window Functions
File: aggregations_and_window_functions.sql
Objective: Use SQL aggregation and window functions to analyze data.
Queries:
- Find the total number of bookings made by each user using COUNT and GROUP BY.
- Rank properties based on the total number of bookings using a window function (ROW_NUMBER or RANK).
