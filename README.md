# CIAP Portal — Final Submission Pack

**Project:** Offline‑First Community Internet Access Platform (CIAP)  
**Goal:** Demonstrate mesh-friendly, offline-first content delivery with intelligent caching and a simple admin UI.

> This repo is structured specifically to satisfy the **Final version of the product/solution** submission (Attempt 1 then zip for Attempt 2).  
> Fill the placeholders, drop in your working code under `/app`, and use the scripts + templates here to package your submission.

---

## 1) How to Install & Run (Step by Step)

### Prerequisites
- Node.js 18+ and npm
- Docker + Docker Compose (optional but recommended for the caching stack)
- Git (optional)
- macOS/Linux or Windows PowerShell

### Quick Start (Local, no Docker)
1. Clone or copy this pack into your project root.
2. Put your **existing app code** (frontend + backend) into the `/app` folder (see structure below).
3. In `/app`, run:
   ```bash
   npm install
   npm run dev
   ```
   - If you have separate folders for `frontend` and `backend`, document each one’s steps here (e.g., `npm run server`, `npm run client`).

### Start with Docker (optional, includes cache services)
1. Ensure Docker Desktop is running.
2. From repo root:
   ```bash
   docker compose up -d
   ```
3. Open the app URL shown by your frontend (e.g., `http://localhost:5173`) and verify Squid/Kiwix services are reachable as configured.

> Replace any port numbers and paths below with your actual app config.

---

## 2) Related Files in this Project

```
ciap-portal-final-pack/
├─ README.md                 # You are here
├─ DEPLOYMENT.md             # Clear, reproducible deployment plan
├─ TESTING.md                # What to demo, how to capture results + metrics
├─ SUBMISSION-CHECKLIST.md   # One-page checklist to ensure you hit all rubric items
├─ scripts/
│  ├─ print_tree.sh          # Writes TREE.md (file listing) for your repo
│  ├─ concat_source.sh       # Concatenates all source into ALL_CODE.txt
│  ├─ print_tree.ps1         # Windows PowerShell version
│  └─ concat_source.ps1      # Windows PowerShell version
├─ docker/
│  ├─ docker-compose.yml     # Example: app + Squid cache + (optional) Kiwix
│  ├─ squid.conf             # Minimal Squid configuration template
│  └─ kiwix/                 # (Optional) Place Kiwix assets or mount a volume
└─ app/                      # PLACE YOUR EXISTING CODE HERE (frontend/backend)
```

---

## 3) 5‑Minute Demo Video (what to show)

Record a clear 5‑minute screen capture demonstrating:
- **Core features**: offline‑first portal browsing, cached resource loading vs first load.
- **Admin basics**: approving uploads, viewing stats (hit ratio / bandwidth saved), triggering sync window.
- **Different data values**: show a few content types (e.g., PDF, page, video).
- **Performance**: quickly show the same item loading fast from cache after first load.
- **Environment note**: optionally show your app running on a low‑spec VM or SBC (Pi) to evidence performance variability.

> Avoid spending time on sign-up/sign-in flows in the video—focus on the core CIAP functionality.

---

## 4) Deployed Version (or Installable Package)

- **URL:** <REPLACE_WITH_DEPLOYED_URL>  
  or attach a packaged build (e.g., `.apk`, `.exe`, or zipped `dist/` + start script) with install steps in `DEPLOYMENT.md`.

---

## 5) Repo File Tree & Full-Code Printout

Use the scripts to generate both a **file tree** and a **single text file** containing all code:

```bash
# macOS/Linux
bash ./scripts/print_tree.sh .
bash ./scripts/concat_source.sh . ALL_CODE.txt

# Windows PowerShell
./scripts/print_tree.ps1 -RepoRoot "."
./scripts/concat_source.ps1 -RepoRoot "." -OutFile "ALL_CODE.txt"
```

Outputs:
- `TREE.md` — a clean, sorted list of files (node_modules, build, .git ignored)
- `ALL_CODE.txt` — concatenation of all source files with headers (`===== FILE: … =====`)

---

## 6) Notes

- Replace all `<REPLACE_…>` placeholders before submission.
- If you used different technologies, update `DEPLOYMENT.md` accordingly.
- For Attempt 2, zip the entire repo you submitted in Attempt 1.
