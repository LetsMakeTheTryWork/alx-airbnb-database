-- ===========================================
-- File: perfomance.sql
-- Objective: Retrieve all bookings with user, property, and payment details
-- Analyze and refactor query for better performance
-- ===========================================

-- Step 1: Initial Query (Unoptimized)
-- This query joins multiple large tables to retrieve all booking information.

EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;

-- Observed inefficiencies:
-- - Scans all tables fully (Sequential Scan)
-- - Joins on non-indexed columns if indexes are missing
-- - Fetches all rows even when not filtered (no WHERE condition)

-- ===========================================
-- Step 2: Refactored Query (Optimized)
-- Use indexes and filter criteria to improve performance
-- ===========================================

EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed'
ORDER BY b.start_date DESC
LIMIT 100;

-- Optimization notes:
-- - Uses WHERE filter to limit scanned rows
-- - Uses ORDER BY + LIMIT to avoid full table scan
-- - Uses indexes: 
--     idx_booking_status, idx_booking_start_date
--     idx_booking_user_id, idx_booking_property_id
--     idx_payment_booking_id
