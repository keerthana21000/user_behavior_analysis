

SELECT discovery_channel,
    SUM(CASE WHEN event = 'view' THEN 1 ELSE 0 END) AS views,
    SUM(CASE WHEN event ='addtocart' THEN 1 ELSE 0 END) AS add_to_carts,
    SUM(CASE WHEN event = 'transaction' THEN 1 ELSE 0 END) AS purchases,
    ROUND(SUM(CASE WHEN event ='addtocart' THEN 1 ELSE 0 END)::numeric/SUM(CASE WHEN event = 'view' THEN 1 ELSE 0 END) * 100.0, 2) AS views_to_carts,
    ROUND(SUM(CASE WHEN event = 'transaction' THEN 1 ELSE 0 END)::numeric/SUM(CASE WHEN event ='addtocart' THEN 1 ELSE 0 END) * 100.0, 2) AS cart_to_purchases
FROM events
JOIN classified USING (visitorid)
GROUP BY discovery_channel;