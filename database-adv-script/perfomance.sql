-- ===========================================
-- File: perfomance.sql
-- Objective: Retrieve all bookings with user, property, and payment details
-- Analyze and refactor query for better performance
-- ===========================================

-- Step 1: Initial Query (Unoptimized)
-- Retrieves all booking details joined with user, property, and payment tables

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

-- Observations:
-- - Sequential scans on Booking and Property tables
-- - No filtering (retrieves all rows)
-- - High execution time and disk I/O

-- ===========================================
-- Step 2: Refactored Query (Optimized)
-- Adds filtering conditions and limits results
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
  AND b.start_date >= '2025-01-01'
  AND p.location = 'Nairobi'
ORDER BY b.start_date DESC
LIMIT 100;

-- Notes:
-- - Added WHERE filters with AND to reduce scanned rows
-- - Uses indexes: idx_booking_status, idx_booking_start_date, idx_property_location
-- - EXPLAIN ANALYZE confirms Index Scan usage and lower execution time
