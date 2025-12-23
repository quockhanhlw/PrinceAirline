# PrinceAirline (Spring Boot + React)

This repo contains:

- `airline-backend/` – Spring Boot (Java) REST API + Security + JPA (MySQL)
- `airline-frontend/` – React app (Create React App)

Default ports (from config):

- Backend API: `http://localhost:8082`
- Frontend UI: `http://localhost:3000`

---

## Prerequisites (Windows)

### 1) Install Java 21

Backend is configured with Java **21** (`<java.version>21</java.version>` in `airline-backend/pom.xml`).

- Install JDK 21 (Temurin/Adoptium recommended)
- Ensure `JAVA_HOME` points to the JDK folder and `java -version` returns 21

### 2) Install MySQL 8.x

Backend is configured to use:

- Database: `flightdb`
- Host: `localhost:3306`

See `airline-backend/src/main/resources/application.properties`.

### 3) Install Node.js

Frontend uses React + `react-scripts`.

- Recommended: Node.js LTS
- Verify `node -v` and `npm -v`

---

## Database setup (MySQL Workbench)

### Option A (recommended): Use the SQL scripts in `airline-backend/`

The project already includes SQL scripts you can import/run:

- `airline-backend/mysql-workbench-init.sql` – create tables + base seed (roles, constraints, etc.)
- `airline-backend/mysql-seed-airports-10countries.sql` – seed airports (IATA codes)

Typical order:

1. Run `mysql-workbench-init.sql`
2. Run `mysql-seed-airports-10countries.sql`
3. Run your flights seed SQL (the script you generated in the chat)

### Quick sanity checks

After importing, the schema should include tables like:

- `roles`, `users`, `users_roles`
- `airports`, `flights`, `bookings`, `passengers`, `email_notifications`

---

## Run the backend (Spring Boot)

From repo root:

```powershell
cd F:\PrinceAirline\airline-backend
.mvnw.cmd spring-boot:run
```

Backend reads configuration from:

- `airline-backend/src/main/resources/application.properties`

When it starts successfully, API base URL:

- `http://localhost:8082`

### Useful endpoints

- Register: `POST /api/auth/register`
- Login: `POST /api/auth/login`

---

## Run the frontend (React)

From repo root:

```powershell
cd F:\PrinceAirline\airline-frontend
npm install
npm start
```

Frontend runs at:

- `http://localhost:3000`

> If the frontend calls the backend, ensure the backend is running on `8082`.

---

## Seed accounts (admin / pilot) + roles

The common flow used in this project is:

1) Create user accounts via API (passwords will be BCrypt-hashed by the server)

- `POST http://localhost:8082/api/auth/register`

2) Assign roles in DB (join table `users_roles`)

> Registration assigns `CUSTOMER` role by default when you don’t specify roles.

If you want to remove `CUSTOMER` from an admin user, delete the mapping row in `users_roles`.

---

## Configuration & security notes (important)

### 1) Don’t commit secrets

`airline-backend/src/main/resources/application.properties` is configured to read secrets from environment variables (recommended) instead of hard-coding them.

Secrets used by the backend:

- `DB_PASSWORD`
- `JWT_SECRET`
- `MAIL_USERNAME`
- `MAIL_PASSWORD`

If this repo is public, you should rotate/replace any secrets that were previously committed.

### Set secrets in PowerShell (current terminal session)

```powershell
$env:DB_PASSWORD = "<your-mysql-root-password>"
$env:JWT_SECRET = "<a-long-random-secret>"
$env:MAIL_USERNAME = "<gmail-address>"
$env:MAIL_PASSWORD = "<gmail-app-password>"
```

Then start backend (same terminal):

```powershell
cd F:\PrinceAirline\airline-backend
.\mvnw.cmd spring-boot:run
```

### 2) Suggested `.gitignore`

Make sure you do not push build artifacts:

- `airline-backend/target/`
- `airline-frontend/node_modules/`
- `airline-frontend/build/` (optional; usually not committed)

---

