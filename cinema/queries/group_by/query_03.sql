use cinema;

select f.id, f.title, count(gf.genre) genres
from film f
inner join genre_film gf
    on gf.film = f.id
where f.year > 2000
group by f.id
order by f.title;
