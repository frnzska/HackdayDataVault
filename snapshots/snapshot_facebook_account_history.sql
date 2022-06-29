{% snapshot snapshot_facebook_account_history %}

{{
    config(
      target_schema='hackday',
      unique_key='_fivetran_id',
      strategy='timestamp',
      updated_at='_fivetran_synced',
    )
}}

SELECT * 
FROM {{ source('fivetran_facebook_ads', 'account_history')}}

{% endsnapshot %}