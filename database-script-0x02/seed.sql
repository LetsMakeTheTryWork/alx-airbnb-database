-- Sample Users
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('uuid-abby', 'Abby', 'Bett', '[abby@yahoo.com](mailto:abby@yahoo.com)', 'hashedpassword1', '1234567890', 'guest'),
('uuid-grace', 'Grace', 'Sawe', '[grace@gmail.com](mailto:grace@example.com)', 'hashedpassword2', '0987654321', 'host'),
('uuid-mitchele', 'Mitchele', 'Mukio', '[mitchele@yahoo.com](mailto:mitchele@example.com)', 'hashedpassword3', '5551234567', 'admin');

-- Sample Properties
INSERT INTO "Property" (property_id, host_id, name, description, location, pricepernight)
VALUES
('prop-1', 'uuid-grace', 'Cozy Apartment', 'A cozy apartment in downtown.', 'New York', 120.00),
('prop-2', 'uuid-grace', 'Beach House', 'Beautiful house with ocean view.', 'Miami', 250.00);

-- Sample Bookings
INSERT INTO "Booking" (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('book-1', 'prop-1', 'uuid-abby', '2025-11-10', '2025-11-15', 600.00, 'confirmed'),
('book-2', 'prop-2', 'uuid-abby', '2025-12-01', '2025-12-05', 1000.00, 'pending');

-- Sample Payments
INSERT INTO "Payment" (payment_id, booking_id, amount, payment_method)
VALUES
('pay-1', 'book-1', 600.00, 'credit_card');

-- Sample Reviews
INSERT INTO "Review" (review_id, property_id, user_id, rating, comment)
VALUES
('rev-1', 'prop-1', 'uuid-abby', 5, 'Amazing stay!'),
('rev-2', 'prop-2', 'uuid-abby', 4, 'Great location but noisy at night.');

-- Sample Messages
INSERT INTO "Message" (message_id, sender_id, recipient_id, message_body)
VALUES
('msg-1', 'uuid-abby', 'uuid-grace', 'Hi! I am interested in your property.'),
('msg-2', 'uuid-grace', 'uuid-abby', 'Hello Abby! The property is available for your dates.');
