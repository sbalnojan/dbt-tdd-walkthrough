{{ config(materialized='table') }}

with order_stats as (
    select
        {{ ref('source_orders') }}.cid as customer_id,
        source,
        count(*)
    from {{ ref('source_orders') }}
    left join {{ ref('source_customers') }}
        on
            {{ ref('source_orders') }}.cid = {{ ref('source_customers') }}.id
    group by customer_id, source
)

select * from order_stats
left join
    {{ ref('source_mkt') }} on
        order_stats.customer_id = {{ ref('source_mkt') }}.cid
