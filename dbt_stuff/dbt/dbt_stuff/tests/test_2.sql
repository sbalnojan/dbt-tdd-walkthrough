{{
    config(
        tags=['unit-test']
    )
}}


{% call dbt_unit_testing.test('customers', 'should show customer_id without orders') %}
  
  {% call dbt_unit_testing.mock_ref ('source_customers') %}
    select 1 as customer_id, '' as first_name, '' as last_name
  {% endcall %}
  
  {% call dbt_unit_testing.expect() %}
    select 1 as customer_id
  {% endcall %}
{% endcall %}
