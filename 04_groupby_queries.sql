-- 1. Station count by network
SELECT network,
       COUNT(DISTINCT station_id) AS station_count
FROM vw_ev_sessions_clean
GROUP BY network
ORDER BY station_count DESC;

-- 2. Station count by city
SELECT city,
       COUNT(DISTINCT station_id) AS station_count
FROM vw_ev_sessions_clean
GROUP BY city
ORDER BY station_count DESC;

-- 3. Average utilization by city
SELECT city,
       ROUND(AVG(utilization_rate) * 100, 2) AS avg_utilization_pct
FROM vw_ev_sessions_clean
GROUP BY city
ORDER BY avg_utilization_pct DESC;

-- 4. Average utilization by network
SELECT network,
       ROUND(AVG(utilization_rate) * 100, 2) AS avg_utilization_pct
FROM vw_ev_sessions_clean
GROUP BY network
ORDER BY avg_utilization_pct DESC;

-- 5. Average wait time by city
SELECT city,
       ROUND(AVG(estimated_wait_time_mins), 2) AS avg_wait_time
FROM vw_ev_sessions_clean
GROUP BY city
ORDER BY avg_wait_time DESC;

-- 6. Average price by network
SELECT network,
       ROUND(AVG(current_price), 2) AS avg_price
FROM vw_ev_sessions_clean
GROUP BY network
ORDER BY avg_price DESC;

-- 7. Charger type performance
SELECT charger_type,
       ROUND(AVG(utilization_rate) * 100, 2) AS avg_utilization_pct,
       ROUND(AVG(estimated_wait_time_mins), 2) AS avg_wait_time,
       ROUND(AVG(current_price), 2) AS avg_price
FROM vw_ev_sessions_clean
GROUP BY charger_type
ORDER BY avg_utilization_pct DESC;

-- 8. Station status count
SELECT station_status,
       COUNT(*) AS row_count
FROM vw_ev_sessions_clean
GROUP BY station_status
ORDER BY row_count DESC;

-- 9. Weather condition count
SELECT weather_condition,
       COUNT(*) AS row_count
FROM vw_ev_sessions_clean
GROUP BY weather_condition
ORDER BY row_count DESC;

-- 10. Hourly utilization
SELECT hour_of_day,
       ROUND(AVG(utilization_rate) * 100, 2) AS avg_utilization_pct
FROM vw_ev_sessions_clean
GROUP BY hour_of_day
ORDER BY hour_of_day;
