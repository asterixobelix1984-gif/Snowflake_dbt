{% macro function1(x) %}
CASE 
    WHEN TO_TIMESTAMP({{x}}) < CURRENT_DATE THEN 'PAST'
    ELSE 'FUTURE'
END


{% endmacro %}

{% macro get_season(x) %}
CASE 
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (12,1,2) THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (3,4,5) THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (6,7,8) THEN 'SUMMER'
    WHEN MONTH(TO_TIMESTAMP({{x}}))IN (9,10,11) THEN 'AUTUMN'
END 


{% endmacro %}

{% macro day_type(x) %}
CASE
    WHEN DAYNAME(TO_TIMESTAMP(STARTED_AT)) IN ('Sat','Sum')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
END 
{% endmacro %}