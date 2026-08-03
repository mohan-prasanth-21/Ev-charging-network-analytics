-- 1. Total rows
SELECT COUNT(*) AS total_rows
FROM fact_ev_sessions;

-- 2. Total columns
SELECT COUNT(*) AS total_columns
FROM user_tab_columns
WHERE table_name = 'FACT_EV_SESSIONS';

-- 3. Date range
SELECT
    MIN(event_timestamp) AS start_date,
    MAX(event_timestamp) AS end_date
FROM fact_ev_sessions;

-- 4. Number of stations
SELECT COUNT(DISTINCT station_id) AS total_stations
FROM fact_ev_sessions;

-- 5. Number of cities
SELECT COUNT(DISTINCT city) AS total_cities
FROM fact_ev_sessions;

-- 6. Number of networks
SELECT COUNT(DISTINCT network) AS total_networks
FROM fact_ev_sessions;

-- 7. Number of charger types
SELECT COUNT(DISTINCT charger_type) AS total_charger_types
FROM fact_ev_sessions;

-- 8. Check missing station IDs
SELECT COUNT(*) AS missing_station_ids
FROM fact_ev_sessions
WHERE station_id IS NULL;

-- 9. Check missing city values
SELECT COUNT(*) AS missing_city_values
FROM fact_ev_sessions
WHERE city IS NULL;

-- 10. Check missing timestamps
SELECT COUNT(*) AS missing_timestamps
FROM fact_ev_sessions
WHERE event_timestamp IS NULL;
