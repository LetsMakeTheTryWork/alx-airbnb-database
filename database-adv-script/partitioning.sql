-- Create the main partitioned table
CREATE TABLE Booking_partitioned (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    price NUMERIC(10,2),
    status VARCHAR(20)
) PARTITION BY RANGE (start_date);

-- Create partitions for each year (adjust according to your data range)
CREATE TABLE Booking_2023 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Optional: Index each partition for faster queries
CREATE INDEX idx_booking_2023_start_date ON Booking_2023 (start_date);
CREATE INDEX idx_booking_2024_start_date ON Booking_2024 (start_date);
CREATE INDEX idx_booking_2025_start_date ON Booking_2025 (start_date);

INSERT INTO Booking_partitioned (booking_id, user_id, property_id, start_date, end_date, price, status)
SELECT booking_id, user_id, property_id, start_date, end_date, price, status
FROM Booking;

-- Fetch bookings in a specific date range
EXPLAIN ANALYZE
SELECT * 
FROM Booking_partitioned
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';

-- Aggregate query by month
EXPLAIN ANALYZE
SELECT DATE_TRUNC('month', start_date) AS month, COUNT(*) AS bookings
FROM Booking_partitioned
GROUP BY month
ORDER BY month;
