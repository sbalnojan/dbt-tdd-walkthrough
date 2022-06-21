{{ config(materialized='table') }}

with order_stats as (
    select
        {{ ref('source_orders') }}.cid as customer_id,
        source,
        count(*) as source_count,
        max(profession) as profession
    from {{ ref('source_orders') }}
    left join {{ ref('source_customers') }}
        on
            {{ ref('source_orders') }}.cid = {{ ref('source_customers') }}.id
    group by customer_id, source
)

select * from order_stats
