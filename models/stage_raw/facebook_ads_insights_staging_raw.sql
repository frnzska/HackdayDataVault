SELECT
    *
FROM {{ source('fivetran_facebook_insights', 'ads_insights')}}