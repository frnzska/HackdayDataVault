
    
    

select
    _fivetran_id as unique_field,
    count(*) as n_records

from FIVETRAN_DATABASE.facebook_ads.account_history
where _fivetran_id is not null
group by _fivetran_id
having count(*) > 1


