use cinema;

select distinct g.name
from genre g
inner join genre_film gf
    on g.id = gf.genre
inner join film f
    on gf.film = f.id
where not exists (
    select p.actor
    from performs p
    where p.film = f.id
) order by g.name;
