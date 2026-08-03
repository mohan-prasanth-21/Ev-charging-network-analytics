-- Executive summary view
CREATE OR REPLACE VIEW vw_ev_summary AS
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT station_id) AS total_stations,
    COUNT(DISTINCT network) AS total_networks,
    COUNT(DISTINCT city) AS total_cities,
    ROUND(AVG(utilization_rate) * 100, 2) AS avg_utilization_pct,
    ROUND(AVG(estimated_wait_time_mins), 2) AS avg_wait_time,
    ROUND(AVG(current_price), 2) AS avg_price
FROM vw_ev_sessions_clean;

-- City summary view
CREATE OR REPLACE VIEW vw_ev_city_summary AS
SELECT
    city,
    COUNT(DISTINCT station_id) AS station_count,
    ROUND(AVG(utilization_rate) * 100, 2) AS avg_utilization_pct,
    ROUND(AVG(estimated_wait_time_mins), 2) AS avg_wait_time,
    ROUND(AVG(current_price), 2) AS avg_price
FROM vw_ev_sessions_clean
GROUP BY city;

-- Network summary view
CREATE OR REPLACE VIEW vw_ev_network_summary AS
SELECT
    network,
    COUNT(DISTINCT station_id) AS station_count,
    ROUND(AVG(utilization_rate) * 100, 2) AS avg_utilization_pct,
    ROUND(AVG(estimated_wait_time_mins), 2) AS avg_wait_time,
    ROUND(AVG(current_price), 2) AS avg_price
FROM vw_ev_sessions_clean
GROUP BY network;

-- Station summary view
CREATE OR REPLACE VIEW vw_ev_station_summary AS
SELECT
    station_id,
    MAX(station_name) AS station_name,
    MAX(network) AS network,
    MAX(city) AS city,
    MAX(state) AS state,
    MAX(charger_type) AS charger_type,
    MAX(ports_total) AS ports_total,
    ROUND(AVG(utilization_rate) * 100, 2) AS avg_utilization_pct,
    ROUND(AVG(estimated_wait_time_mins), 2) AS avg_wait_time,
    ROUND(AVG(current_price), 2) AS avg_price
FROM vw_ev_sessions_clean
GROUP BY station_id;

SELECT * FROM vw_ev_summary;
