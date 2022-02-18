use cinema;

select b.id, b.title, count(f.id) films
from book b
inner join film f
    on f.book = b.id
group by b.id
having films > 1;
