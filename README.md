# SecureAuth Guard — Login Brute-Force Detection System

A Java 21 standard-library application for demonstrating login security monitoring in a college student portal. No external dependencies or Maven installation required.

## Problem
Attackers can repeatedly try passwords against student accounts, or try one password across many accounts (password spraying). This project records events, detects suspicious patterns and temporarily restricts source IP addresses.

## Features
- Password hashing using PBKDF2-HMAC-SHA256 with per-user random salts and 210,000 iterations
- Login page and admin security dashboard
- 5-minute sliding window: alert after 5 failed attempts against an account
- Source IP temporary restriction after 10 failures in 5 minutes
- Password-spraying heuristic: 4 distinct target usernames from one IP in 5 minutes
- Append-only local TSV event log, recent event table and metrics
- Admin dashboard token generated at every startup
- Binds to localhost only; ignores untrusted X-Forwarded-For

## Run (Windows)
Install JDK 21 or newer and confirm `java -version` and `javac -version`. Open Command Prompt inside this project directory and run `run.bat`. Copy the printed demo credentials and dashboard URL. Visit http://127.0.0.1:8080/.

## Run (Linux/macOS)
`bash run.sh`

## Live demonstration
1. Start the application and copy the randomly generated student password from the terminal.
2. Open the login page and enter an incorrect password five times. Observe an account-level alert in the dashboard.
3. Enter more incorrect passwords from the same local IP to trigger temporary restriction.
4. To demonstrate spraying instead, restart with a fresh empty `data/events.tsv` (keep `data/users.tsv`) and attempt four different usernames with incorrect passwords.
5. Review dashboard counts, timestamps, and detection reasons.

**Note:** Restriction applies to all users sharing the same source IP. This is a deliberate simple lab demonstration, not a production-ready defense. Do not run public-facing without HTTPS, trusted reverse-proxy configuration, proper authenticated sessions, CSRF protections, structured persistent storage, distributed rate limiting, log rotation and monitoring.

## Project structure
- `src/main/java/com/secureauth/Main.java` — HTTP server, authentication, detection, dashboard
- `data/users.tsv` — generated demo account password hash; not committed
- `data/events.tsv` — local security event log; not committed
- `run.bat` and `run.sh` — compile and run

## Academic concepts
Java records, collections, concurrent maps, synchronization, file I/O, exception handling, Java HTTP server, password-based cryptography, sliding-window detection, HTTP forms and security logging.
