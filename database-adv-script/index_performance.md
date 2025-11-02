-- ===========================================
-- Database Optimization: Index Creation Script
-- File: database_index.sql
-- Objective: Improve query performance by adding indexes
-- ===========================================

-- USER TABLE
-- email is often used for lookups and authentication
CREATE INDEX idx_user_email ON User(email);

-- role and created_at are commonly filtered or ordered by
CREATE INDEX idx_user_role ON User(role);
CREATE INDEX idx_user_created_at ON User(created_at);

-- PROPERTY TABLE
-- host_id is frequently joined with User
CREATE INDEX idx_property_host_id ON Property(host_id);

-- location and pricepernight used for search and sorting
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_pricepernight ON Property(pricepernight);

-- created_at can be useful for listing latest properties
CREATE INDEX idx_property_created_at ON Property(created_at);

-- BOOKING TABLE
-- property_id and user_id used in JOINs and lookups
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- status and start_date are often filtered or ordered
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- PAYMENT TABLE
-- booking_id is used for JOINs
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- payment_method and payment_date may be used in reports
CREATE INDEX idx_payment_method ON Payment(payment_method);
CREATE INDEX idx_payment_date ON Payment(payment_date);

-- REVIEW TABLE
-- property_id and user_id used for joins and lookups
CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_review_user_id ON Review(user_id);

-- rating and created_at often used for sorting/filtering
CREATE INDEX idx_review_rating ON Review(rating);
CREATE INDEX idx_review_created_at ON Review(created_at);

-- MESSAGE TABLE
-- sender_id and recipient_id for user communication queries
CREATE INDEX idx_message_sender_id ON Message(sender_id);
CREATE INDEX idx_message_recipient_id ON Message(recipient_id);

-- sent_at used for ordering conversation history
CREATE INDEX idx_message_sent_at ON Message(sent_at);
