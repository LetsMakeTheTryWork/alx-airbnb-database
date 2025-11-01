-- =============================================
-- File: aggregations_and_window_functions.sql
-- Directory: database-adv-script
-- Objective: Use SQL aggregation and window functions to analyze data
-- =============================================

-- 1. Total number of bookings made by each user
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    User u
LEFT JOIN 
    Booking b
ON 
    u.user_id = b.user_id
GROUP BY 
    u.user_id, u.first_name, u.last_name
ORDER BY 
    total_bookings DESC;

-- 2. Rank properties based on total number of bookings
SELECT 
    p.property_id,
    p.name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM 
    Property p
LEFT JOIN 
    Booking b
ON 
    p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name
ORDER BY 
    booking_rank;

-- 3. Average rating of properties with ranking
SELECT 
    p.property_id,
    p.name,
    AVG(r.rating) AS avg_rating,
    RANK() OVER (ORDER BY AVG(r.rating) DESC) AS rating_rank
FROM 
    Property p
LEFT JOIN 
    Review r
ON 
    p.property_id = r.property_id
GROUP BY 
    p.property_id, p.name
ORDER BY 
    rating_rank;

-- 4. Total messages sent by each user
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(m.message_id) AS total_messages_sent
FROM
    User u
LEFT JOIN
    Message m
ON
    u.user_id = m.sender_id
GROUP BY
    u.user_id, u.first_name, u.last_name
ORDER BY
    total_messages_sent DESC;

-- 5. Total messages received by each user
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(m.message_id) AS total_messages_received
FROM
    User u
LEFT JOIN
    Message m
ON
    u.user_id = m.recipient_id
GROUP BY
    u.user_id, u.first_name, u.last_name
ORDER BY
    total_messages_received DESC;
