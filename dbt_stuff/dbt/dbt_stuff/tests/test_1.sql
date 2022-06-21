{{
    config(
        tags=['unit-test']
    )
}}


{% call dbt_unit_testing.test('2_report', 'should show customer_id without orders') %}
  
  {% call dbt_unit_testing.mock_ref ('source_orders') %}
    select 1 as cid
    UNION ALL 
    select 1 as cid
  {% endcall %}
  
  {% call dbt_unit_testing.mock_ref ('source_customers') %}
    select 1 as id, 'firefighter' as profession
  {% endcall %}
    
  {% call dbt_unit_testing.expect() %}
    select 1 as customer_id, 'firefighter' as profession,
    1 as source, 0.5 as per_source_p
    UNION ALL
    select 1 as customer_id, 'firefighter' as profession,
    2 as source, 0.5 as per_source_p
  {% endcall %}
{% endcall %}
