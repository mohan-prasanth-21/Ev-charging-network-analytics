-- 1. Show first 20 rows
SELECT *
FROM vw_ev_sessions_clean
FETCH FIRST 20 ROWS ONLY;

-- 2. Show all unique networks
SELECT DISTINCT network
FROM vw_ev_sessions_clean
ORDER BY network;

-- 3. Show all unique cities
SELECT DISTINCT city
FROM vw_ev_sessions_clean
ORDER BY city;

-- 4. Show all unique charger types
SELECT DISTINCT charger_type
FROM vw_ev_sessions_clean
ORDER BY charger_type;

-- 5. Stations in Los Angeles
SELECT *
FROM vw_ev_sessions_clean
WHERE city = 'Los Angeles'
FETCH FIRST 50 ROWS ONLY;

-- 6. High utilization rows
SELECT station_id, station_name, city, utilization_rate
FROM vw_ev_sessions_clean
WHERE utilization_rate >= 0.80
ORDER BY utilization_rate DESC
FETCH FIRST 50 ROWS ONLY;

-- 7. High wait-time rows
SELECT station_id, station_name, city, estimated_wait_time_mins
FROM vw_ev_sessions_clean
WHERE estimated_wait_time_mins >= 15
ORDER BY estimated_wait_time_mins DESC
FETCH FIRST 50 ROWS ONLY;

-- 8. Out-of-service ports
SELECT station_id, station_name, city, ports_out_of_service
FROM vw_ev_sessions_clean
WHERE ports_out_of_service > 0
ORDER BY ports_out_of_service DESC
FETCH FIRST 50 ROWS ONLY;

-- 9. Peak-hour rows
SELECT *
FROM vw_ev_sessions_clean
WHERE UPPER(is_peak_hour) IN ('TRUE', 'YES', 'Y', '1')
FETCH FIRST 50 ROWS ONLY;

-- 10. Weekend rows
SELECT *
FROM vw_ev_sessions_clean
WHERE UPPER(is_weekend) IN ('TRUE', 'YES', 'Y', '1')
FETCH FIRST 50 ROWS ONLY;
