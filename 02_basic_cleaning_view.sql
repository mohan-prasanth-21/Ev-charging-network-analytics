

CREATE OR REPLACE VIEW vw_ev_sessions_clean AS
SELECT
    event_timestamp,
    TRIM(station_id) AS station_id,
    TRIM(station_name) AS station_name,
    TRIM(network) AS network,
    TRIM(city) AS city,
    TRIM(state) AS state,
    latitude,
    longitude,
    TRIM(location_type) AS location_type,
    TRIM(charger_type) AS charger_type,
    power_output_kw,
    TRIM(amenities_nearby) AS amenities_nearby,
    ports_total,
    ports_available,
    ports_occupied,
    ports_out_of_service,
    utilization_rate,
    TRIM(station_status) AS station_status,
    estimated_wait_time_mins,
    avg_session_duration_mins,
    current_price,
    TRIM(pricing_type) AS pricing_type,
    temperature_f,
    precipitation_mm,
    TRIM(weather_condition) AS weather_condition,
    gas_price_per_gallon,
    traffic_congestion_index,
    NVL(TRIM(local_event), 'No Event') AS local_event,
    is_weekend,
    is_peak_hour,
    hour_of_day,
    day_of_week,
    month_number
FROM fact_ev_sessions
WHERE event_timestamp IS NOT NULL
  AND station_id IS NOT NULL;

-- Check clean view count
SELECT COUNT(*) AS clean_rows
FROM vw_ev_sessions_clean;


