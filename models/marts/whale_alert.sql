WITH Whales
AS
(

SELECT
    output_address,
    SUM(output_value) AS total_sent,
    count(*) as tx_count
FROM {{ref('stg_btc_transactions_2')}}
WHERE 
output_value>10
GROUP  BY
output_address
ORDER BY 
total_sent
),
LATEST_PRICE
AS
(
    
SELECT SALES  AS price FROM {{ref('tacoma')}} WHERE STOREID=1520 AND  DATE='1/1/2014'
)
SELECT
    output_address,
    total_sent,
    tx_count,
    --(p.price * w.total_sent) as total_sent_usd
    {{convert_to_usd('w.total_sent')}} as total_sent_usd
FROM Whales w
--CROSS JOIN LATEST_PRICE p
