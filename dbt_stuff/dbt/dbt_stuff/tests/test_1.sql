{{
    config(
        tags=['unit-test']
    )
}}


{% call dbt_unit_testing.test('1_report', 'should show customer_id without orders') %}
  
  {% call dbt_unit_testing.mock_ref ('source_orders') %}
    select 1 as cid, '' as first_name, '' as last_name
  {% endcall %}
  
  {% call dbt_unit_testing.expect() %}
    select 1 as customer_id
  {% endcall %}
{% endcall %}
