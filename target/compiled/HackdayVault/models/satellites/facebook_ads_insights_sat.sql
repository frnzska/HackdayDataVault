

-- Generated by dbtvault.

WITH source_data AS (
    SELECT a."FACEBOOK_ADS_INSIGHTS_HK", a."DATE", a."COUNTRY", a."SPEND", a."AD_ID", a."_FIVETRAN_SYNCED", a."RECORD_SOURCE"
    FROM BLINKIST_DEV.hackday.facebook_ads_insights_staging_hashed AS a
    WHERE a."FACEBOOK_ADS_INSIGHTS_HK" IS NOT NULL
),

records_to_insert AS (
    SELECT DISTINCT stage."FACEBOOK_ADS_INSIGHTS_HK", stage."DATE", stage."COUNTRY", stage."SPEND", stage."AD_ID", stage."_FIVETRAN_SYNCED", stage."RECORD_SOURCE"
    FROM source_data AS stage
)

SELECT * FROM records_to_insert