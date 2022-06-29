
{%- set yaml_metadata -%}
source_model: 'facebook_ads_insights_staging_raw'
derived_columns:
  RECORD_SOURCE: '!FIVETRAN_FACEBOOK_ADS_INSIGHTS_RAW'
  COUNTRY_CODE: 'COUNTRY'
hashed_columns:
  FACEBOOK_ADS_INSIGHTS_HK:
    - 'COUNTRY_CODE'
    - 'DATE'
    - 'AD_ID'
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