DROP TABLE IF EXISTS favorites CASCADE;
DROP TABLE IF EXISTS history CASCADE;
DROP TABLE IF EXISTS subscriptions CASCADE;
DROP TABLE IF EXISTS movies CASCADE;
DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
    user_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL UNIQUE,
    user_email VARCHAR(100) NOT NULL UNIQUE,
    user_password VARCHAR(100) NOT NULL,
    user_birthdate DATE NOT NULL CHECK (user_birthdate >= DATE '1900-01-01')
);

CREATE TABLE movies (
    movie_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    movie_title VARCHAR(100) NOT NULL,
    release_year INTEGER NOT NULL CHECK (release_year >= 1900 AND release_year <= 2026),
    duration INTEGER NOT NULL CHECK (duration > 0),
    age_restriction INTEGER NOT NULL CHECK (age_restriction IN (0, 6, 12, 16, 18)),
    description TEXT
);

CREATE TABLE history (
    history_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    movie_id BIGINT NOT NULL REFERENCES movies(movie_id) ON DELETE CASCADE,
    watched_at TIMESTAMP NOT NULL
);

CREATE TABLE favorites (
    user_id BIGINT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    movie_id BIGINT NOT NULL REFERENCES movies(movie_id) ON DELETE CASCADE,
    added_at TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (user_id, movie_id)
);

CREATE TABLE subscriptions (
    subscription_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    sub_type VARCHAR(50) NOT NULL CHECK (sub_type IN ('standard', 'plus', 'pro')),
    sub_start DATE NOT NULL CHECK (sub_start >= DATE '1900-01-01'),
    sub_end DATE NOT NULL CHECK (sub_end >= DATE '1900-01-01'),
    state VARCHAR(20) NOT NULL CHECK (state IN ('active', 'expired', 'future')),
    CHECK (sub_end > sub_start)
);
