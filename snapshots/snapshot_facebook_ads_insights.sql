{% snapshot snapshot_facebook_ads_insights %}

{{
    config(
      target_schema='hackday',
      unique_key=dbt_utils.surrogate_key(["ad_id", "date", "country"]),
      strategy='timestamp',
      updated_at='_fivetran_synced',
    )
}}

SELECT * 
FROM {{ source('fivetran_facebook_insights', 'ads_insights')}}

{% endsnapshot %}