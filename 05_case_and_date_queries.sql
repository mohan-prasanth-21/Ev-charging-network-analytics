-- 1. Utilization category
SELECT
    CASE
        WHEN utilization_rate >= 0.80 THEN 'High'
        WHEN utilization_rate >= 0.50 THEN 'Medium'
        ELSE 'Low'
    END AS utilization_category,
    COUNT(*) AS row_count
FROM vw_ev_sessions_clean
GROUP BY
    CASE
        WHEN utilization_rate >= 0.80 THEN 'High'
        WHEN utilization_rate >= 0.50 THEN 'Medium'
        ELSE 'Low'
    END
ORDER BY row_count DESC;

-- 2. Wait-time category
SELECT
    CASE
        WHEN estimated_wait_time_mins >= 15 THEN 'High Wait'
        WHEN estimated_wait_time_mins >= 5 THEN 'Medium Wait'
        ELSE 'Low Wait'
    END AS wait_category,
    COUNT(*) AS row_count
FROM vw_ev_sessions_clean
GROUP BY
    CASE
        WHEN estimated_wait_time_mins >= 15 THEN 'High Wait'
        WHEN estimated_wait_time_mins >= 5 THEN 'Medium Wait'
        ELSE 'Low Wait'
    END
ORDER BY row_count DESC;

-- 3. Time-of-day category
SELECT
    CASE
        WHEN hour_of_day BETWEEN 0 AND 5 THEN 'Late Night'
        WHEN hour_of_day BETWEEN 6 AND 11 THEN 'Morning'
        WHEN hour_of_day BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN hour_of_day BETWEEN 17 AND 21 THEN 'Evening'
        ELSE 'Night'
    END AS time_period,
    ROUND(AVG(utilization_rate) * 100, 2) AS avg_utilization_pct,
    ROUND(AVG(estimated_wait_time_mins), 2) AS avg_wait_time
FROM vw_ev_sessions_clean
GROUP BY
    CASE
        WHEN hour_of_day BETWEEN 0 AND 5 THEN 'Late Night'
        WHEN hour_of_day BETWEEN 6 AND 11 THEN 'Morning'
        WHEN hour_of_day BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN hour_of_day BETWEEN 17 AND 21 THEN 'Evening'
        ELSE 'Night'
    END;

-- 4. Daily trend
SELECT
    TRUNC(event_timestamp) AS event_date,
    ROUND(AVG(utilization_rate) * 100, 2) AS avg_utilization_pct,
    ROUND(AVG(estimated_wait_time_mins), 2) AS avg_wait_time
FROM vw_ev_sessions_clean
GROUP BY TRUNC(event_timestamp)
ORDER BY event_date;

-- 5. Monthly trend
SELECT
    TO_CHAR(event_timestamp, 'YYYY-MM') AS year_month,
    ROUND(AVG(utilization_rate) * 100, 2) AS avg_utilization_pct,
    ROUND(AVG(current_price), 2) AS avg_price
FROM vw_ev_sessions_clean
GROUP BY TO_CHAR(event_timestamp, 'YYYY-MM')
ORDER BY year_month;

-- 6. Day-of-week trend
SELECT
    TO_CHAR(event_timestamp, 'DAY') AS day_name,
    ROUND(AVG(utilization_rate) * 100, 2) AS avg_utilization_pct
FROM vw_ev_sessions_clean
GROUP BY TO_CHAR(event_timestamp, 'DAY')
ORDER BY avg_utilization_pct DESC;

-- 7. Peak vs non-peak
SELECT
    CASE
        WHEN UPPER(is_peak_hour) IN ('TRUE', 'YES', 'Y', '1')
        THEN 'Peak Hour'
        ELSE 'Non-Peak Hour'
    END AS peak_status,
    ROUND(AVG(utilization_rate) * 100, 2) AS avg_utilization_pct,
    ROUND(AVG(estimated_wait_time_mins), 2) AS avg_wait_time,
    ROUND(AVG(current_price), 2) AS avg_price
FROM vw_ev_sessions_clean
GROUP BY
    CASE
        WHEN UPPER(is_peak_hour) IN ('TRUE', 'YES', 'Y', '1')
        THEN 'Peak Hour'
        ELSE 'Non-Peak Hour'
    END;

-- 8. Weekend vs weekday
SELECT
    CASE
        WHEN UPPER(is_weekend) IN ('TRUE', 'YES', 'Y', '1')
        THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    ROUND(AVG(utilization_rate) * 100, 2) AS avg_utilization_pct,
    ROUND(AVG(estimated_wait_time_mins), 2) AS avg_wait_time
FROM vw_ev_sessions_clean
GROUP BY
    CASE
        WHEN UPPER(is_weekend) IN ('TRUE', 'YES', 'Y', '1')
        THEN 'Weekend'
        ELSE 'Weekday'
    END;
