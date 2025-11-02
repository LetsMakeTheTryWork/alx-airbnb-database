-- ===========================================
-- Database Optimization: Index Creation Script
-- File: database_index.sql
-- Objective: Improve query performance by adding indexes
-- ===========================================

-- USER TABLE
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);
CREATE INDEX idx_user_created_at ON User(created_at);

-- PROPERTY TABLE
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_pricepernight ON Property(pricepernight);
CREATE INDEX idx_property_created_at ON Property(created_at);

-- BOOKING TABLE
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- PAYMENT TABLE
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
CREATE INDEX idx_payment_method ON Payment(payment_method);
CREATE INDEX idx_payment_date ON Payment(payment_date);

-- REVIEW TABLE
CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_review_user_id ON Review(user_id);
CREATE INDEX idx_review_rating ON Review(rating);
CREATE INDEX idx_review_created_at ON Review(created_at);

-- MESSAGE TABLE
CREATE INDEX idx_message_sender_id ON Message(sender_id);
CREATE INDEX idx_message_recipient_id ON Message(recipient_id);
CREATE INDEX idx_message_sent_at ON Message(sent_at);


-- ===========================================
-- Performance Measurement Section
-- Using EXPLAIN ANALYZE before and after indexing
-- ===========================================

-- Example query before indexing:
-- (Run this before executing CREATE INDEX statements)
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE user_id = 'U001' AND status = 'confirmed'
ORDER BY start_date DESC;

-- Example query after indexing:
-- (Run this after executing CREATE INDEX statements)
EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE user_id = 'U002' AND status = 'confirmed'
ORDER BY start_date DESC;

-- Another performance test example
EXPLAIN ANALYZE
SELECT * FROM Property
WHERE location = 'Nairobi' AND pricepernight < 100
ORDER BY created_at DESC;

-- And one more
EXPLAIN ANALYZE
SELECT * FROM User
WHERE email = 'guest@gmail.com';
