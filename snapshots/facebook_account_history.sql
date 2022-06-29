{% snapshot snapshot_fivetran_facebook__account_history %}

{{
    config(
      unique_key='_fivetran_id',
      strategy='timestamp',
      updated_at='_fivetran_synced',
    )
}}

SELECT * 
FROM {{ source('fivetran_facebook_ads', 'account_history')}}

{% endsnapshot %}