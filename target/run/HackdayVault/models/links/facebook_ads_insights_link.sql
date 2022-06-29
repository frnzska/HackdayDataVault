

      create or replace transient table BLINKIST_DEV.hackday.facebook_ads_insights_link  as
      (-- Generated by dbtvault.

WITH row_rank_1 AS (
    SELECT rr."FACEBOOK_ADS_INSIGHTS_HK", rr."ACCOUNT_ID", rr."_FIVETRAN_SYNCED", rr."RECORD_SOURCE",
           ROW_NUMBER() OVER(
               PARTITION BY rr."FACEBOOK_ADS_INSIGHTS_HK"
               ORDER BY rr."_FIVETRAN_SYNCED"
           ) AS row_number
    FROM BLINKIST_DEV.hackday.facebook_ads_insights_staging_hashed AS rr
    WHERE rr."FACEBOOK_ADS_INSIGHTS_HK" IS NOT NULL
    AND rr."ACCOUNT_ID" IS NOT NULL
    QUALIFY row_number = 1
),

records_to_insert AS (
    SELECT a."FACEBOOK_ADS_INSIGHTS_HK", a."ACCOUNT_ID", a."_FIVETRAN_SYNCED", a."RECORD_SOURCE"
    FROM row_rank_1 AS a
)

SELECT * FROM records_to_insert
      );
    