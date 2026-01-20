


{{config(materialized='incremental',incremental_strategy='merge', unique_key='HASH_KEY')}}


SELECT 
* 
FROM
{{ source('btc', 'btc') }}

--Links used in this lecture:


-- https://docs.getdbt.com/docs/build/incremental-models

-- https://docs.getdbt.com/docs/build/incremental-strategy


{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  -- (uses >= to include records whose timestamp occurred since the last run of this model)
  -- (If event_time is NULL or the table is truncated, the condition will always be true and load all records)
where BLOCK_TIMESTAMP >= (select max(BLOCK_TIMESTAMP) from {{ this }} )

{% endif %}