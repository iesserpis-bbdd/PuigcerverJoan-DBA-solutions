use cinema;

select distinct b.title
from book b
inner join film f
    on f.book = b.id
where not exists (
    select p.actor
    from performs p
    inner join actor a
        on p.actor = a.id
    inner join country c
        on a.country = c.id
    where c.name = "USA" and p.film = f.id
) order by b.title;
