-- 1.1. Добавление новой сущности и связанных с ней записей с помощью INSERT
BEGIN;
WITH new_user AS (
    INSERT INTO users (user_name, user_email, user_password, user_birthdate) 
    VALUES ('new_user', 'new_user@mail.com', 'new_pass', '1991-09-01') 
    RETURNING user_id
)
INSERT INTO subscriptions (user_id, sub_type, sub_start, sub_end, state) 
SELECT user_id, 'pro', '2026-03-01', '2026-04-01', 'active' 
FROM new_user;

-- 1.2. Изменение состояния существующей операции через UPDATE
UPDATE subscriptions 
SET state = 'expired' 
WHERE user_id = (SELECT user_id FROM users WHERE user_name = 'new_user');

-- 1.3. Массовое изменение нескольких записей по содержательному условию
UPDATE users 
SET user_password = 'new_default_pass' 
WHERE user_birthdate < '1995-01-01';

-- 1.4. Удаление записи с помощью DELETE с учётом существующих ограничений целостности
DELETE FROM users 
WHERE user_name = 'new_user';

-- 1.5. Демонстрацию отмены изменений с помощью ROLLBACK
ROLLBACK;


-- 2.1. Многотабличные запросы

-- 1. Получение подробной информации об операциях и связанных сущностях из 3 таблицы
SELECT u.user_name, m.movie_title, h.watched_at
FROM users u
JOIN history h ON u.user_id = h.user_id
JOIN movies m ON h.movie_id = m.movie_id
WHERE u.user_id = 1
ORDER BY h.watched_at DESC;

-- 2. Выявление объектов, у которых отсутствуют связанные записи
SELECT u.user_name, s.sub_type
FROM users u
LEFT JOIN subscriptions s ON u.user_id = s.user_id
WHERE s.subscription_id IS NULL;

-- 3. Получение перечня объектов, удовлетворяющих нескольким взаимосвязанным условиям
SELECT DISTINCT u.user_name
FROM users u
JOIN subscriptions s ON u.user_id = s.user_id
JOIN history h ON u.user_id = h.user_id
WHERE s.sub_type = 'pro' AND s.state = 'active'
ORDER BY u.user_name;


-- 2.2. Агрегация и группировка

-- 1. Расчет количественных показателей по группам
SELECT u.user_name, COUNT(h.history_id) AS watch_count
FROM users u
JOIN history h ON u.user_id = h.user_id
GROUP BY u.user_name
ORDER BY watch_count DESC
LIMIT 10;

-- 2. Расчёт суммарных или средних показателей с фильтрацией групп через HAVING
SELECT sub_type, COUNT(*) AS total_subs, AVG(sub_end - sub_start) AS avg_days
FROM subscriptions
GROUP BY sub_type
HAVING COUNT(*) >= 5;

-- 3. Сравнение показателей между категориями объектов или временными периодами
SELECT 
    age_restriction, 
    COUNT(*) AS movies_count, 
    MIN(duration) AS min_duration, 
    MAX(duration) AS max_duration, 
    ROUND(AVG(duration), 2) AS avg_duration
FROM movies
GROUP BY age_restriction
ORDER BY age_restriction;


-- 3.1. Сравнение с вычисляемым показателем
SELECT movie_title, duration
FROM movies
WHERE duration > (SELECT AVG(duration) FROM movies);

-- 3.2. Проверка существования связанных данных
SELECT u.user_name
FROM users u
WHERE EXISTS (
    SELECT 1 FROM favorites f WHERE f.user_id = u.user_id
);

-- 3.3. Поиск отсутствующих событий
SELECT u.user_name
FROM users u
WHERE NOT EXISTS (
    SELECT 1 FROM history h WHERE h.user_id = u.user_id
);

-- 3.4. Коррелированный подзапрос
SELECT 
    u.user_name,
    (SELECT COUNT(*) FROM history h WHERE h.user_id = u.user_id) AS total_watches
FROM users u
WHERE u.user_id <= 10
ORDER BY total_watches DESC;


-- 4. Комплексный аналитический отчёт с использованием CTE

WITH active_users AS (
    SELECT user_id 
    FROM subscriptions 
    WHERE state = 'active'
),
user_history AS (
    SELECT 
        au.user_id,
        m.age_restriction,
        m.duration
    FROM active_users au
    JOIN history h ON au.user_id = h.user_id
    JOIN movies m ON h.movie_id = m.movie_id
)
SELECT 
    age_restriction,
    COUNT(*) AS total_views,
    SUM(duration) AS total_minutes,
    ROUND(AVG(duration), 1) AS avg_minutes
FROM user_history
GROUP BY age_restriction
ORDER BY total_views DESC;
