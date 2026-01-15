WITH bike
AS
(
SELECT 
ride_id,
RIDEABLE_TYPE,
REPLACE(started_at,'"','') AS started_at,
REPLACE(ended_at,'"','') AS ended_at,
start_station_name,
start_statio_id,
end_station_name,
end_station_id,
start_lat,
start_lng,
end_lat,
end_lng,
member_csual


 FROM {{ source('demo', 'bike_aws') }}
WHERE 
started_at !='"starttime'
)

SELECT * FROM bike