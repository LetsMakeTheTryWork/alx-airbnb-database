# Navigate to your repository root
cd "C:\Users\Abby Bett\Documents\alx-airbnb-database"

# Create the directory if it doesn't exist
mkdir database-adv-script

# Navigate into the directory
cd database-adv-script

# Create joins_queries.sql with your existing content
@"
-- ==========================
-- joins_queries.sql
-- Directory: database-adv-script
-- Objective: Practice SQL joins
-- ==========================

-- 1. INNER JOIN: Retrieve all bookings and the respective users who made them
SELECT 
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.name AS user_name,
    b.property_id
FROM bookings b
INNER JOIN users u
    ON b.user_id = u.user_id
ORDER BY b.booking_date;

-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties with no reviews
SELECT
    p.property_id,
    p.name AS property_name,
    r.review_id,
    r.comment AS review_comment,
    r.rating
FROM properties p
LEFT JOIN reviews r
    ON p.property_id = r.property_id
ORDER BY p.property_id;

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking has no user
SELECT
    u.user_id,
    u.name AS user_name,
    b.booking_id,
    b.property_id,
    b.booking_date
FROM users u
FULL OUTER JOIN bookings b
    ON u.user_id = b.user_id
ORDER BY u.user_id, b.booking_id;
