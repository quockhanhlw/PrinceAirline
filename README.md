# PrinceAirline — Full‑Stack Airline Booking (Spring Boot + React)

[![Java](https://img.shields.io/badge/Java-21-informational)](#)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-4.0.0--SNAPSHOT-brightgreen)](#)
[![React](https://img.shields.io/badge/React-CRA-blue)](#)
[![MySQL](https://img.shields.io/badge/MySQL-8.x-blue)](#)
[![License](https://img.shields.io/badge/License-MIT-lightgrey)](#license)

PrinceAirline is a full‑stack airline booking web application. It provides REST APIs (Spring Boot) and a React UI for flight search, booking, and admin management.

This repository contains:

- `airline-backend/` – Spring Boot REST API + Security + JPA (MySQL)
- `airline-frontend/` – React app (Create React App)

Default ports:

- Backend API: `http://localhost:8082`
- Frontend UI: `http://localhost:3000`

---

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Demo](#demo)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Contributing](#contributing)
- [License](#license)
- [Contact & Authors](#contact--authors)

---

## Installation

### Prerequisites

- Java **21** (backend uses `<java.version>21</java.version>`)
- MySQL **8.x**
- Node.js (LTS recommended) + npm

Optional (recommended): MySQL Workbench

### Database setup (MySQL)

The backend is configured to use:

- Database name: `flightdb`
- Host: `localhost:3306`

You can initialize the schema and seed data using the provided SQL scripts:

1. `airline-backend/mysql-workbench-init.sql` (tables + base seed)
2. `airline-backend/mysql-seed-airports-10countries.sql` (airports)
3. (Optional) your flights seed script

After importing, you should see tables like `roles`, `users`, `users_roles`, `airports`, `flights`, `bookings`.

### Backend configuration (secrets)

The backend reads secrets from environment variables (see `airline-backend/src/main/resources/application.properties`):

- `DB_PASSWORD`
- `JWT_SECRET`
- `MAIL_USERNAME`
- `MAIL_PASSWORD`

Set them in PowerShell (current terminal session):

```powershell
$env:DB_PASSWORD = "<your-mysql-password>"
$env:JWT_SECRET = "<a-long-random-secret>"
$env:MAIL_USERNAME = "<gmail-address>"   # optional
$env:MAIL_PASSWORD = "<gmail-app-password>" # optional
```

---

## Usage

### Run backend (Spring Boot)

```powershell
cd F:\PrinceAirline\airline-backend
.\mvnw.cmd spring-boot:run
```

API base URL: `http://localhost:8082`

### Run frontend (React)

```powershell
cd F:\PrinceAirline\airline-frontend
npm install
npm start
```

UI URL: `http://localhost:3000`

### Example API requests

Register:

```powershell
$body = @'
{
	"email": "user@example.com",
	"password": "Password123@",
	"fullName": "Demo User"
}
'@

Invoke-RestMethod -Method Post -Uri "http://localhost:8082/api/auth/register" -ContentType "application/json" -Body $body
```

Login:

```powershell
$body = @'
{
	"email": "user@example.com",
	"password": "Password123@"
}
'@

Invoke-RestMethod -Method Post -Uri "http://localhost:8082/api/auth/login" -ContentType "application/json" -Body $body
```

> Note: registration assigns `CUSTOMER` role by default. If you create admin/pilot accounts, you can map roles through `users_roles`.

---

## Demo

Add screenshots/GIFs here (recommended):

- Home / Find Flights page
- Booking flow
- Admin dashboard

---

## Features

- User authentication (JWT) and password hashing (BCrypt)
- Role‑based access control: `ADMIN`, `PILOT`, `CUSTOMER`
- Airports & flights management
- Booking flow with passenger information
- Email templates (Thymeleaf) for welcome / booking ticket (optional mail setup)
- SQL scripts for schema + seed data (roles, airports, flights)

---

## Tech Stack

- **Backend:** Java 21, Spring Boot, Spring Security, Spring Data JPA (Hibernate), Validation
- **Frontend:** React (Create React App), React Router, Axios
- **Database:** MySQL
- **Build/Tools:** Maven Wrapper, npm, Git/GitHub

---

## Contributing

Contributions are welcome.

1. Fork the repository
2. Create a branch: `feature/<short-name>`
3. Commit with clear messages
4. Open a Pull Request describing the change and how to test it

If you find a bug or have a feature request, please open an Issue with:

- Steps to reproduce
- Expected vs actual behavior
- Screenshots/logs if available

---

## Contact & Authors

- Author: Quoc Khanh
- GitHub: https://github.com/quockhanhlw

