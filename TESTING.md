# TESTING & DEMO CAPTURE

## What to Demonstrate
- **Different testing strategies**: manual functional checks, basic load test, and network observation.
- **Different data values**: PDFs, HTML pages, videos in portal.
- **Performance across environments**: e.g., your laptop vs a low-spec VM or Pi.

## Step-by-Step

### A. Functional Pass (Manual)
1. First‑load a resource (expect MISS, slower).
2. Repeat‑load same resource (expect HIT, faster).
3. Toggle upstream off (simulate offline) and open cached assets (still available).
4. Upload a local PDF/video as Admin and access it from User view.

Capture 5–8 screenshots:
- First load vs repeated load (show timing/UX difference).
- Admin dashboard: Cache stats and sync action.
- Offline portal access page working.
- Upload success + resource visible to users.

### B. Light Load Test (Optional)
- Use `npm run test:load` (configure with k6/Locust if you have it) or open multiple browser tabs.
- Show a quick chart or metric table: average latency, p95, cache hit ratio.

### C. Network Observation (Optional)
- Use Wireshark/tcpdump to show fewer upstream requests on repeated loads.
- Screenshot a brief comparison (first vs repeated).

### D. Performance Variability
- Run the same “load a resource twice” demo on two machines (e.g., laptop vs low‑spec VM).
- Note any differences in time‑to‑load and CPU/memory impact.

## Save All Evidence
- Put screenshots into `/evidence/` folder and reference them in your README or video.
