{% macro convert_to_usd(column_name) %}
{{column_name}}*
(
    SELECT SALES  AS price FROM {{ref('tacoma')}} WHERE STOREID=1520 AND  DATE='1/1/2014'

)

{% endmacro %}