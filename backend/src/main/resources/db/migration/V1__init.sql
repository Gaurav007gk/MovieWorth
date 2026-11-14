CREATE TABLE movies (
 id BIGSERIAL PRIMARY KEY, tmdb_id BIGINT UNIQUE, title VARCHAR(300) NOT NULL, original_title VARCHAR(300), language VARCHAR(30), release_date DATE, poster_path VARCHAR(300), overview TEXT, popularity DOUBLE PRECISION, created_at TIMESTAMPTZ NOT NULL DEFAULT now(), updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX idx_movies_title ON movies USING gin (to_tsvector('simple', title));
CREATE TABLE box_office_collections (
 id BIGSERIAL PRIMARY KEY, movie_id BIGINT NOT NULL REFERENCES movies(id) ON DELETE CASCADE, collection_date DATE NOT NULL, india_net_cr NUMERIC(14,2), india_gross_cr NUMERIC(14,2), overseas_gross_cr NUMERIC(14,2), worldwide_gross_cr NUMERIC(14,2), source VARCHAR(80) NOT NULL, source_url TEXT, created_at TIMESTAMPTZ NOT NULL DEFAULT now(), UNIQUE(movie_id, collection_date, source)
);
CREATE INDEX idx_collection_date ON box_office_collections(collection_date DESC);
CREATE TABLE ingestion_jobs (id BIGSERIAL PRIMARY KEY, source VARCHAR(80) NOT NULL, started_at TIMESTAMPTZ NOT NULL DEFAULT now(), finished_at TIMESTAMPTZ, status VARCHAR(20) NOT NULL, records_processed INT NOT NULL DEFAULT 0, error TEXT);
