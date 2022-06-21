{{
    config(
        tags=['unit-test']
    )
}}

{% call dbt_unit_testing.test ('1_report','has new column', {"mocking_strategy": "Pure"} ) %}

  {% call dbt_unit_testing.mock_ref ('source_customers') %}
    select 1 as customer_id
  {% endcall %}

  {% call dbt_unit_testing.mock_ref ('source_mkt') %}
    select 1 as duh
  {% endcall %}

  {% call dbt_unit_testing.mock_ref ('source_orders') %}
    select 1 as duh
  {% endcall %}

  {% call dbt_unit_testing.expect() %}
    select  new_column
  {% endcall %}

{% endcall %}
