-- PrinceAirline - MySQL Workbench init script
-- Generated to match JPA entities in airline-backend (table names: roles, users, users_roles, airports, flights, bookings, passengers, email_notifications)
-- MySQL 8.x compatible.

-- Create DB (optional)
CREATE DATABASE IF NOT EXISTS flightdb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE flightdb;

-- =====================
-- Table: roles
-- =====================
CREATE TABLE IF NOT EXISTS roles (
  id BIGINT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_roles_name (name)
) ENGINE=InnoDB;

-- =====================
-- Table: users
-- =====================
CREATE TABLE IF NOT EXISTS users (
  id BIGINT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),
  email VARCHAR(255),
  phone_number VARCHAR(50),
  password VARCHAR(255),
  email_verified BIT(1) NOT NULL DEFAULT b'0',
  provider VARCHAR(50) NOT NULL,
  provider_id VARCHAR(255),
  active BIT(1) NOT NULL DEFAULT b'1',
  created_at DATETIME(6),
  updated_at DATETIME(6),
  PRIMARY KEY (id),
  UNIQUE KEY uk_users_email (email)
) ENGINE=InnoDB;

-- =====================
-- Table: users_roles (Many-to-Many)
-- =====================
CREATE TABLE IF NOT EXISTS users_roles (
  user_id BIGINT NOT NULL,
  role_id BIGINT NOT NULL,
  PRIMARY KEY (user_id, role_id),
  KEY idx_users_roles_role (role_id),
  CONSTRAINT fk_users_roles_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  CONSTRAINT fk_users_roles_role FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- =====================
-- Table: airports
-- =====================
CREATE TABLE IF NOT EXISTS airports (
  id BIGINT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  city VARCHAR(100) NOT NULL,
  country VARCHAR(100) NOT NULL,
  iata_code VARCHAR(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_airports_iata_code (iata_code)
) ENGINE=InnoDB;

-- =====================
-- Table: flights
-- =====================
CREATE TABLE IF NOT EXISTS flights (
  id BIGINT NOT NULL AUTO_INCREMENT,
  flight_number VARCHAR(255) NOT NULL,
  status VARCHAR(50),
  departure_airport_id BIGINT,
  arrival_airport_id BIGINT,
  departure_time DATETIME(6),
  arrival_time DATETIME(6),
  base_price DECIMAL(19,2),
  assigned_pilot_id BIGINT,
  PRIMARY KEY (id),
  UNIQUE KEY uk_flights_flight_number (flight_number),
  KEY idx_flights_departure_airport (departure_airport_id),
  KEY idx_flights_arrival_airport (arrival_airport_id),
  KEY idx_flights_assigned_pilot (assigned_pilot_id),
  CONSTRAINT fk_flights_departure_airport FOREIGN KEY (departure_airport_id) REFERENCES airports (id) ON DELETE SET NULL,
  CONSTRAINT fk_flights_arrival_airport FOREIGN KEY (arrival_airport_id) REFERENCES airports (id) ON DELETE SET NULL,
  CONSTRAINT fk_flights_assigned_pilot FOREIGN KEY (assigned_pilot_id) REFERENCES users (id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- =====================
-- Table: bookings
-- =====================
CREATE TABLE IF NOT EXISTS bookings (
  id BIGINT NOT NULL AUTO_INCREMENT,
  booking_reference VARCHAR(255) NOT NULL,
  user_id BIGINT,
  flight_id BIGINT,
  booking_date DATETIME(6),
  status VARCHAR(50),
  PRIMARY KEY (id),
  UNIQUE KEY uk_bookings_booking_reference (booking_reference),
  KEY idx_bookings_user (user_id),
  KEY idx_bookings_flight (flight_id),
  CONSTRAINT fk_bookings_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE SET NULL,
  CONSTRAINT fk_bookings_flight FOREIGN KEY (flight_id) REFERENCES flights (id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- =====================
-- Table: passengers
-- =====================
CREATE TABLE IF NOT EXISTS passengers (
  id BIGINT NOT NULL AUTO_INCREMENT,
  booking_id BIGINT,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  passport_number VARCHAR(255),
  type VARCHAR(50),
  seat_number VARCHAR(50),
  special_requests VARCHAR(255),
  PRIMARY KEY (id),
  KEY idx_passengers_booking (booking_id),
  CONSTRAINT fk_passengers_booking FOREIGN KEY (booking_id) REFERENCES bookings (id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- =====================
-- Table: email_notifications
-- =====================
CREATE TABLE IF NOT EXISTS email_notifications (
  id BIGINT NOT NULL AUTO_INCREMENT,
  subject VARCHAR(255),
  recipient_email VARCHAR(255),
  body LONGTEXT,
  booking_id BIGINT,
  sent_at DATETIME(6),
  is_html BIT(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (id),
  KEY idx_email_notifications_booking (booking_id),
  KEY idx_email_notifications_recipient (recipient_email),
  CONSTRAINT fk_email_notifications_booking FOREIGN KEY (booking_id) REFERENCES bookings (id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- =====================
-- Seed data (minimum required for registration)
-- =====================
INSERT INTO roles (name) VALUES ('ADMIN')
  AS new
  ON DUPLICATE KEY UPDATE name = new.name;
INSERT INTO roles (name) VALUES ('CUSTOMER')
  AS new
  ON DUPLICATE KEY UPDATE name = new.name;
INSERT INTO roles (name) VALUES ('PILOT')
  AS new
  ON DUPLICATE KEY UPDATE name = new.name;
