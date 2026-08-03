-- Final check

SELECT COUNT(*) AS raw_rows
FROM fact_ev_sessions;

SELECT COUNT(*) AS clean_rows
FROM vw_ev_sessions_clean;

SELECT * FROM vw_ev_summary;

SELECT object_name, object_type, status
FROM user_objects
WHERE object_name IN (
    'VW_EV_SESSIONS_CLEAN',
    'VW_EV_SUMMARY',
    'VW_EV_CITY_SUMMARY',
    'VW_EV_NETWORK_SUMMARY',
    'VW_EV_STATION_SUMMARY'
)
ORDER BY object_name;

-- Expected raw row count:
-- 1,317,750
