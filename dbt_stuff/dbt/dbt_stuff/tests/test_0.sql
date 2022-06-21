{{
    config(
        tags=['unit-test']
    )
}}

{% call dbt_unit_testing.test('2_order_stats', 'should have orders per source') %}
  
  {% call dbt_unit_testing.mock_ref ('source_orders') %}
    select 1 as cid, 1 as source
    UNION ALL 
    select 1 as cid, 2 as source
  {% endcall %}
    
  {% call dbt_unit_testing.expect() %}
    select 1 as customer_id, 1 as source, 0.5 as per_source_p
    UNION ALL
    select 1 as customer_id, 2 as source, 0.5 as per_source_p
  {% endcall %}
{% endcall %}

UNION ALL

{% call dbt_unit_testing.test('2_order_stats_pre', 'should have orders per source') %}
  
  {% call dbt_unit_testing.mock_ref ('source_orders') %}
    select 1 as cid, 1 as source
    UNION ALL 
    select 1 as cid, 2 as source
  {% endcall %}
    
  {% call dbt_unit_testing.expect() %}
    select 1 as customer_id, 2 as total_order_count
  {% endcall %}
{% endcall %}
