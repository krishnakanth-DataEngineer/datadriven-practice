SELECT
  *
FROM alert_events
WHERE LOWER(severity) IN ('high', 'critical')
  AND SUBSTRING(fired_at, 0, 5) = '2026'
