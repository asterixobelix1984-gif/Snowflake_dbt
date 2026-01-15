WITH bike
AS
(

SELECT 
DISTINCT
start_statio_id AS start_station_iod,
start_station_name,
start_lat,
start_lng
FROM 
{{ source('demo', 'bike_aws') }}

)
SELECT * FROM bike