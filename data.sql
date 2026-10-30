INSERT INTO users (user_name, user_email, user_password, user_birthdate) VALUES
('name1', 'name1@123.com', 'password1', '1991-01-01'),
('name2', 'name2@123.com', 'password2', '1992-02-02'),
('name3', 'name3@123.com', 'password3', '1993-03-03'),
('name4', 'name4@123.com', 'password4', '1994-04-04'),
('name5', 'name5@123.com', 'password5', '1995-05-05');

INSERT INTO movies (movie_title, release_year, duration, age_restriction, description) VALUES
('film1', 2001, 101, 0, 'description1'),
('film2', 2002, 102, 6, 'description2'),
('film3', 2003, 103, 12, 'description3'),
('film4', 2004, 104, 16, 'description4'),
('film5', 2005, 105, 18, 'description5');

INSERT INTO history (user_id, movie_id, watched_at) VALUES
(1, 1, '2026-01-10 20:00:00'),
(1, 2, '2026-01-11 21:30:00'),
(2, 3, '2026-01-12 15:00:00'),
(3, 4, '2026-01-13 22:15:00'),
(4, 5, '2026-01-14 19:45:00');

INSERT INTO favorites (user_id, movie_id, added_at) VALUES
(1, 1, '2026-01-01 10:00:00'),
(1, 4, '2026-01-02 11:30:00'),
(2, 3, '2026-01-03 14:15:00'),
(3, 4, '2026-01-04 18:45:00'),
(4, 2, '2026-01-05 20:00:00');

INSERT INTO subscriptions (user_id, sub_type, sub_start, sub_end, state) VALUES
(1, 'standard', '2026-01-01', '2026-02-01', 'expired'),
(2, 'plus', '2026-01-05', '2026-02-05', 'active'),
(3, 'pro', '2025-12-01', '2026-01-01', 'expired'),
(4, 'standard', '2026-01-10', '2026-02-10', 'active'),
(5, 'plus', '2026-05-15', '2026-06-15', 'future');
