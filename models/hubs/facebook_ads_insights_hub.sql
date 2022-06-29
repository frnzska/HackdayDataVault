{{ config(materialized='incremental')    }}

{%- set source_model = "facebook_ads_insights_staging_hashed"   -%}
{%- set src_pk = "FACEBOOK_ADS_INSIGHTS_HK"          -%}
{%- set src_nk = ["AD_ID" , "DATE", "COUNTRY_CODE"]       -%}
{%- set src_ldts = "_FIVETRAN_SYNCED"      -%}
{%- set src_source = "RECORD_SOURCE"    -%}

{{ dbtvault.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}{{ config(materialized='incremental')    }}