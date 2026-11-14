# MovieWorth

Static GitHub Pages frontend + Spring Boot/PostgreSQL backend.

## Run backend
1. Install Docker Desktop.
2. Copy `backend/.env.example` to `backend/.env`; set your TMDB API key from https://www.themoviedb.org/settings/api.
3. `cd backend && docker compose --env-file .env up --build`
4. Health: http://localhost:8080/actuator/health
5. Import TMDB movies: `POST http://localhost:8080/api/movies/sync/tmdb` (curl/Postman).

## REST API
- `GET /api/movies` popular movies
- `GET /api/movies/{id}` details
- `GET /api/movies/trending`
- `GET /api/movies/search?q=...`
- `GET /api/movies/{id}/collections` history
- `GET /api/box-office/today`
- `GET /api/box-office/top` latest ranking
- `POST /api/movies/sync/tmdb`

## Hourly licensed box-office feed
Scheduler runs hourly; configure `BOX_OFFICE_SOURCE_ENABLED=true`, `BOX_OFFICE_FEED_URL`, `BOX_OFFICE_FEED_TOKEN` for an authorized JSON endpoint. Expected array: `[{"tmdbId":123,"date":"2026-11-14","indiaNetCr":12.5,"indiaGrossCr":14.8,"overseasCr":3.2,"worldwideCr":18,"sourceUrl":"https://provider.example/report/123"}]`.

**Sacnilk:** no unofficial scraping included. Obtain permission/documented feed access first; don't scrape pages or bypass access controls.

## Deploy frontend/backend
GitHub Pages cannot run Java. Deploy API + PostgreSQL on a Java-capable host, set `window.MOVIEWORTH_API_BASE` to deployed API URL ending `/api` before `app.js`, and configure CORS to `https://gaurav007gk.github.io`. Never expose API/feed secrets in frontend JS.