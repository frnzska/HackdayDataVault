SELECT
    *
FROM {{ source('fivetran_facebook_ads', 'account_history')}}