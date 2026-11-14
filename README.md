# MovieWorth 🎬

Responsive movie box-office dashboard with search, language filters, sortable collections, upcoming releases and movie detail/day-wise chart.

## Data disclaimer
All included amounts and release entries are **illustrative demo data**, not live or verified Sacnilk figures. This repository does not scrape Sacnilk. For exact Sacnilk data and hourly updates, obtain written permission and a licensed API/data feed first.

## Run locally
`python -m http.server 8080` then open http://localhost:8080.

## GitHub Pages
Repository Settings → Pages → Deploy from branch → `main` → `/(root)

## Production roadmap
- Spring Boot REST API + PostgreSQL
- Licensed hourly data importer and source timestamp/revision audit
- APIs: `GET /api/movies`, `GET /api/movies/{slug}`, `GET /api/movies/{slug}/collections`, `GET /api/advance-booking`
- Keep provider credentials on the server, never in browser JavaScript.

MIT license applies to starter code only; third-party movie data/posters are excluded.
