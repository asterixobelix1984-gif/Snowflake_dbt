WITH CTE
AS
(
SELECT 
    t.* 
FROM 
    {{ref('trip_fact')}} t
LEFT JOIN {{ref('daily_wheater')}} w
ON W.daily_weather=t.TRIP_DATE
--WHERE W.Weather is not null

)
SELECT * FROM CTE