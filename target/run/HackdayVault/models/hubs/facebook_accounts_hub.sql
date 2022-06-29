{{ config(materialized='incremental')    }}

{%- set source_model = "facebook_accounts_staging_hashed"   -%}
{%- set src_pk = "FACEBOOK_ACCOUNTS_HK"          -%}
{%- set src_nk = "ACCOUNT_ID"          -%}
{%- set src_ldts = "_FIVETRAN_SYNCED"      -%}
{%- set src_source = "RECORD_SOURCE"    -%}

{{ dbtvault.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}{{ config(materialized='incremental')    }}