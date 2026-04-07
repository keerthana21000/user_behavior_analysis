CREATE VIEW classified AS
WITH session_stats AS(
SELECT visitorid,
    COUNT(DISTINCT itemid) AS items_viewed,
    MIN(timestamp) as session_start,
    MAX(timestamp) as session_end,
    LEAST(SUM(CASE WHEN event = 'transaction' THEN 1 ELSE 0 END),1) as purchased
FROM events
GROUP BY visitorid)

SELECT visitorid,
    purchased,
    items_viewed,
    session_start,
    session_end,
    CASE
        WHEN items_viewed <= 2 THEN 'search_type'
        WHEN items_viewed >= 10 THEN 'browse_type'
        ELSE 'mixed'
    END AS discovery_channel
FROM session_stats;

SELECT discovery_channel, 
    SUM(purchased) as converters,
    ROUND(100.0 * SUM(purchased)/COUNT(*), 2) AS conversion_rate
FROM classified
GROUP BY discovery_channel;


