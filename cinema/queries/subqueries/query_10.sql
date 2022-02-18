use cinema;

select count(distinct(f.id)) how_many_films
from film f
inner join genre_film gf
    on gf.film = f.id
inner join genre g
    on gf.genre = g.id
where g.name = "Comedia" and 1 = (
    select count(p.actor)
    from performs p
    where p.film = f.id and p.role = "Secundario"
);
