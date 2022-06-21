/*
    Welcome to
*/

{{ config(materialized='table') }}

select * from {{ ref('2_order_stats') }}
left join
    {{ ref('source_mkt') }} on
        {{ ref('2_order_stats') }}.customer_id = {{ ref('source_mkt') }}.cid
-- time: 9 s
