{{ config(materialized='incremental')         }}

{%- set source_model = "facebook_accounts_staging_hashed"        -%}
{%- set src_pk = "FACEBOOK_ACCOUNTS_HK"         -%}
{%- set src_fk = "ACCOUNT_ID" -%}
{%- set src_ldts = "_FIVETRAN_SYNCED"           -%}
{%- set src_source = "RECORD_SOURCE"         -%}

{{ dbtvault.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                 src_source=src_source, source_model=source_model) }}