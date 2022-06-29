{% snapshot snapshot_fivetran_facebook__ads_insights %}

{{
    config(
      unique_key=taod_utils.concat_ws("|","ad_id", "date", "country"),
      strategy='timestamp',
      updated_at='_fivetran_synced',
    )
}}

SELECT * 
FROM {{ source('fivetran_facebook_insights', 'ads_insights')}}

{% endsnapshot %}