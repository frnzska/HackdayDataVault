
{%- set yaml_metadata -%}
source_model: 'facebook_accounts_staging_raw'
derived_columns:
  RECORD_SOURCE: '!FIVETRAN_FACEBOOK_ACCOUNTS_RAW'
  CURRENCY_CODE: 'CURRENCY'
  ACCOUNT_ID: 'ID'
hashed_columns:
  FACEBOOK_ACCOUNTS_HK:
    - 'ACCOUNT_ID'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

{{ dbtvault.stage(include_source_columns=true,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=hashed_columns,
                  ranked_columns=none) }}