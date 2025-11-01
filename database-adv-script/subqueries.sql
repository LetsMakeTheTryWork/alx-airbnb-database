-- ==========================
-- subqueries.sql
-- Directory: database-adv-script
-- Objective: Practice correlated and non-correlated subqueries
-- ==========================

-- 1. Non-correlated subquery: Find all properties with avg rating > 4
SELECT *
FROM Property p
WHERE p.property_id IN (
    SELECT r.property_id
    FROM Review r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);

-- 2. Correlated subquery: Find users who made more than 3 bookings
SELECT u.user_id, u.first_name, u.last_name
FROM User u
WHERE 3 < (
    SELECT COUNT(*)
    FROM Booking b
    WHERE b.user_id = u.user_id
);
