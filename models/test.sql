SELECT
*
FROM {{ source('demo', ' BIKE_AWS') }}

LIMIT 10;
