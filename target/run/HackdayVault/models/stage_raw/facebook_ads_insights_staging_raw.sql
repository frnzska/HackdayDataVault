
  create or replace  view BLINKIST_DEV.hackday.facebook_ads_insights_staging_raw
  
   as (
    SELECT
    *
FROM FIVETRAN_DATABASE.facebook.ads_insights
  );
