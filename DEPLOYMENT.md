# DEPLOYMENT

This document explains how to deploy the CIAP Portal with optional caching services.

## Option A: Local Development (No Docker)
1. Ensure Node.js 18+ is installed.
2. Navigate to `/app` and run your usual dev/start commands.
3. Configure any environment variables in `/app/.env`.
4. Confirm the app is reachable (e.g., http://localhost:5173).

## Option B: Docker Compose (App + Squid + Optional Kiwix)

### 1) Configure
- Update `docker/docker-compose.yml` with your expected ports and service names.
- Place a minimal `squid.conf` in `docker/squid.conf` (provided template).
- (Optional) Mount a volume with Kiwix ZIM files.

### 2) Launch
```bash
cd docker
docker compose up -d
```

### 3) Verify
- App: http://localhost:5173 (or your configured port)
- Squid: http://localhost:3128 (proxy layer)
- Kiwix: http://localhost:8083 (if enabled)

### 4) Environment Variables
Create `/app/.env` (example):
```
VITE_API_URL=http://localhost:3000
CACHE_PROXY=http://squid:3128
KIWIX_URL=http://kiwix:8083
```

## Option C: Raspberry Pi / Edge Device
1. Install Docker on Raspberry Pi OS.
2. Copy this repo to the Pi.
3. `docker compose up -d` under `/docker`.
4. Point mesh/Wi‑Fi clients to the Pi’s IP; ensure routes are set for the proxy if applicable.

## Logs & Health
- Use `docker compose logs -f <service>` to observe behavior.
- Add simple health endpoints in your app (e.g., `/healthz`).

## Backup/Restore
- Back up `/app/.env`, database files (e.g., SQLite/MySQL dump), and any `content/` directory.
- Use volume mounts in `docker-compose.yml` so persistent data survives container restarts.
