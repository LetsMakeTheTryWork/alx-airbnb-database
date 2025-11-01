# Airbnb Clone ERD Requirements

## Entities and Attributes

1. **User**
   - id (PK)
   - name
   - email
   - password (hashed)
   - enum (host/guest)

2. **Property**
   - id (PK)
   - user_id (FK → User.id)
   - title
   - description
   - price_per_night
   - location

3. **Booking**
   - id (PK)
   - user_id (FK → User.id)
   - property_id (FK → Property.id)
   - check_in_date
   - check_out_date
   - total_price

4. **Review**
   - id (PK)
   - user_id (FK → User.id)
   - property_id (FK → Property.id)
   - rating
   - comment

5. **Payment**
   - id (PK)
   - booking_id (FK → Booking.id)
   - amount
   - payment_method
   - status

6. **Message**
   - id (PK)
   - sender_id (FK → User.id)
   - receiver_id (FK → User.id)
   - booking_id (FK → Booking.id)
   - timestamp

## Relationships

- One **User** → Many **Properties**
- One **User** → Many **Bookings**
- One **Property** → Many **Bookings**
- One **Property** → Many **Reviews**
- One **Booking** → One **Payment**
- One **User** → Many **Messages** (as sender)
- One **User** → Many **Messages** (as receiver)
- One **Booking** → Many **Messages** 





