--https://docs.snowflake.com/en/sql-reference/functions/flatten

WITH flattened_outouts
AS
(

SELECT
tx.hash_key,
tx.block_number,
tx.BLOCK_TIMESTAMP,
tx.is_coinbase,
f.value:address::STRING AS output_address,
f.value:value::FLOAT as output_value


FROM
{{ref('stg_btc')}} tx,
LATERAL FLATTEN(input =>outputs) f

WHERE f.value:address IS NOT NULL


{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  -- (uses >= to include records whose timestamp occurred since the last run of this model)
  -- (If event_time is NULL or the table is truncated, the condition will always be true and load all records)
AND tx.BLOCK_TIMESTAMP >= (select max(BLOCK_TIMESTAMP) from {{ this }} )

{% endif %}

)
SELECT 
    hash_key,
    block_number,
    BLOCK_TIMESTAMP,
    is_coinbase,
    output_address,
    output_value
FROM
    flattened_outouts