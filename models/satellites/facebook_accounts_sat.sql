
{%- set yaml_metadata -%}
source_model: facebook_accounts_staging_hashed
src_pk: FACEBOOK_ACCOUNTS_HK
src_payload:
  - ACCOUNT_ID
  - CURRENCY_CODE
  - NAME
src_ldts: _FIVETRAN_SYNCED
src_source: RECORD_SOURCE
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.sat(src_pk=metadata_dict["src_pk"],
                src_payload=metadata_dict["src_payload"],
                src_ldts=metadata_dict["src_ldts"],
                src_source=metadata_dict["src_source"],
                source_model=metadata_dict["source_model"]) }}