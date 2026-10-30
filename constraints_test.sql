-- UNIQUE user_name
INSERT INTO users (user_name, user_email, user_password, user_birthdate)
VALUES ('name1', 'new@123.com', 'password', '1999-09-09');

-- UNIQUE user_email
INSERT INTO users (user_name, user_email, user_password, user_birthdate)
VALUES ('new', 'name2@123.com', 'password', '1999-09-09');

-- CHECK user_birthdate >= 1900-01-01
INSERT INTO users (user_name, user_email, user_password, user_birthdate)
VALUES ('new', 'new@123.com', 'password', '1888-08-08');

-- NOT NULL user_name
INSERT INTO users (user_name, user_email, user_password, user_birthdate)
VALUES (NULL, 'new@123.com', 'password', '1999-09-09');

-- NOT NULL user_email
INSERT INTO users (user_name, user_email, user_password, user_birthdate)
VALUES ('new', NULL, 'password', '1999-09-09');

-- NOT NULL user_password
INSERT INTO users (user_name, user_email, user_password, user_birthdate)
VALUES ('new', 'new@123.com', NULL, '1999-09-09');

-- NOT NULL user_birthdate
INSERT INTO users (user_name, user_email, user_password, user_birthdate)
VALUES ('new', 'new@123.com', 'password', NULL);

-- CHECK release_year >= 1900
INSERT INTO movies (movie_title, release_year, duration, age_restriction)
VALUES ('new', 1888, 80, 18);

-- CHECK release_year <= 2026
INSERT INTO movies (movie_title, release_year, duration, age_restriction)
VALUES ('new', 2027, 80, 18);

-- CHECK duration > 0
INSERT INTO movies (movie_title, release_year, duration, age_restriction)
VALUES ('new', 2020, -12, 12);

-- CHECK age_restriction IN (0, 6, 12, 16, 18)
INSERT INTO movies (movie_title, release_year, duration, age_restriction)
VALUES ('new', 2020, 80, 8);

-- NOT NULL movie_title
INSERT INTO movies (movie_title, release_year, duration, age_restriction)
VALUES (NULL, 2020, 80, 12);

-- NOT NULL release_year
INSERT INTO movies (movie_title, release_year, duration, age_restriction)
VALUES ('new', NULL, 80, 12);

-- NOT NULL duration
INSERT INTO movies (movie_title, release_year, duration, age_restriction)
VALUES ('new', 2020, NULL, 12);

-- NOT NULL age_restriction
INSERT INTO movies (movie_title, release_year, duration, age_restriction)
VALUES ('new', 2020, 80, NULL);

-- NOT NULL user_id
INSERT INTO history (user_id, movie_id, watched_at)
VALUES (NULL, 1, '2026-01-01 00:00:00');

-- NOT NULL movie_id
INSERT INTO history (user_id, movie_id, watched_at)
VALUES (1, NULL, '2026-01-01 00:00:00');

-- NOT NULL watched_at
INSERT INTO history (user_id, movie_id, watched_at)
VALUES (1, 1, NULL);

-- NOT NULL user_id
INSERT INTO favorites (user_id, movie_id)
VALUES (NULL, 1);

-- NOT NULL movie_id
INSERT INTO favorites (user_id, movie_id)
VALUES (1, NULL);

-- NOT NULL added_at
INSERT INTO favorites (user_id, movie_id, added_at)
VALUES (5, 5, NULL);

-- CHECK sub_type IN ('standard', 'plus', 'pro')
INSERT INTO subscriptions (user_id, sub_type, sub_start, sub_end, is_active)
VALUES (1, 'unstandard', '2020-02-02', '2030-03-02', true);

-- CHECK sub_start >= 1900-01-01
INSERT INTO subscriptions (user_id, sub_type, sub_start, sub_end, is_active)
VALUES (1, 'standard', '1888-08-08', '2030-03-02', true);

-- CHECK sub_end >= 1900-01-01
INSERT INTO subscriptions (user_id, sub_type, sub_start, sub_end, is_active)
VALUES (1, 'standard', '2020-02-02', '1888-08-08', true);

-- CHECK sub_end > sub_start
INSERT INTO subscriptions (user_id, sub_type, sub_start, sub_end, is_active)
VALUES (1, 'standard', '2011-11-02', '2020-02-02', true);

-- NOT NULL user_id
INSERT INTO subscriptions (user_id, sub_type, sub_start, sub_end, is_active)
VALUES (NULL, 'standard', '2020-02-02', '2030-03-02', true);

-- NOT NULL sub_type
INSERT INTO subscriptions (user_id, sub_type, sub_start, sub_end, is_active)
VALUES (1, NULL, '2020-02-02', '2030-03-02', true);

-- NOT NULL sub_start
INSERT INTO subscriptions (user_id, sub_type, sub_start, sub_end, is_active)
VALUES (1, 'standard', NULL, '2030-03-02', true);

-- NOT NULL sub_end
INSERT INTO subscriptions (user_id, sub_type, sub_start, sub_end, is_active)
VALUES (1, 'standard', '2020-02-02', NULL, true);

-- NOT NULL is_active
INSERT INTO subscriptions (user_id, sub_type, sub_start, sub_end, is_active)
VALUES (1, 'standard', '2020-02-02', '2030-03-02', NULL);
