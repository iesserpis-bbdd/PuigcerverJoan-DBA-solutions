use cinema;

select f.id, f.title, count(distinct(p.actor)) actors
from film f
inner join genre_film gf
    on gf.film = f.id
inner join performs p
    on p.film = f.id
group by f.id
having count(distinct(gf.genre)) = 1
order by f.title, f.id;
