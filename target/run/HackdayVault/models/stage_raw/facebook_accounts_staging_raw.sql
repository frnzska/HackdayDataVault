
  create or replace  view BLINKIST_DEV.hackday.facebook_accounts_staging_raw
  
   as (
    SELECT
    *
FROM FIVETRAN_DATABASE.facebook_ads.account_history
  );
