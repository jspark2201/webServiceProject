select * from user;
select id from idea;
delete from idea where id=13;
select idea_id from participants;
select * from good;
select id from comments where idea_id=8;
select writer, title from idea;
SELECT idea_id FROM comments WHERE idea_id=8;
select title from idea;
select id, state from idea where state=3;
SELECT i.id,i.writer FROM idea i, pictures p 
WHERE i.id=p.idea_id and i.writer LIKE '%test%' OR i.title LIKE '%test%'
ORDER BY registration_date;
select id from idea;
select title from idea where id=8;
select src from pictures where idea_id=8;
select id,state, complete_date from idea where title='dddddd';
dddddd