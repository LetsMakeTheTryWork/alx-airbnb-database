# Airbnb Clone Database Normalization (3NF)

## Goal

Make sure the Airbnb database is organized in **Third Normal Form (3NF)** so that it doesn’t have repeated data and is easier to update.

---

## Steps

### 1. First Normal Form (1NF)

* Make sure each table has a **primary key**.
* Every column has a **single value** (no lists or multiple values in one column).

**Example:**

* `User` table: `name`, `email`, and `role` are all single values.
* `Booking` table: `check_in_date` and `check_out_date` are separate columns.

---

### 2. Second Normal Form (2NF)

* Make sure **all non-key columns depend on the full primary key**.
* If a table has a composite key, no column should depend on just part of it.

**Example:**

* `Booking` table: `total_price` depends on both `user_id` and `property_id`.
* No column depends on only part of a key.

---

### 3. Third Normal Form (3NF)

* Make sure **no column depends on another non-key column** (no transitive dependencies).
* If it does, make a new table for it.

**Example:**

* `Property.location` stays in `Property` because it only depends on `Property.id`.
* `User.role` depends only on `User.id`.
* `Booking.total_price` can stay for convenience, even though it can be calculated from `price_per_night`.

---

## Final 3NF Tables

1. **User**

   * id (PK)
   * name
   * email
   * password (hashed)
   * role (host/guest)

2. **Property**

   * id (PK)
   * user_id (FK → User.id)
   * title
   * description
   * price_per_night
   * location

3. **Booking**

   * id (PK)
   * user_id (FK → User.id)
   * property_id (FK → Property.id)
   * check_in_date
   * check_out_date
   * total_price

4. **Review**

   * id (PK)
   * user_id (FK → User.id)
   * property_id (FK → Property.id)
   * rating
   * comment

5. **Payment**

   * id (PK)
   * booking_id (FK → Booking.id)
   * amount
   * payment_method
   * status

6. **Message**

   * id (PK)
   * sender_id (FK → User.id)
   * receiver_id (FK → User.id)
   * booking_id (FK → Booking.id)
   * timestamp

---

## Conclusion

* All tables follow **3NF** rules.
* No repeated data.
* Easy to update and maintain.
* `total_price` can be stored or calculated—both are fine if updates are handled properly.
