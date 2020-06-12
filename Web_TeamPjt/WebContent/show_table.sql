select * from user;
select id from idea;
delete from idea where id=13;
select idea_id from participants;
select * from good;
select id from comments where idea_id=8;
select writer, title from idea;
SELECT idea_id FROM comments WHERE idea_id=8;
select title from idea;

SELECT i.id,i.writer FROM idea i, pictures p 
WHERE i.id=p.idea_id and i.writer LIKE '%test%' OR i.title LIKE '%test%'
ORDER BY registration_date;
select id from idea;
select title from idea where id=8;
select src from pictures where idea_id=8;
SELECT COUNT(*) 
FROM idea 
WHERE title LIKE 'test' or writer LIKE 'test';
select idea_id from participants where type="개발자";
SELECT Max(id) FROM idea
select number_participants from idea where id=3;
SELECT i.id, i.title, i.writer, i.registration_date, i.state, p.src 
FROM idea i, pictures p, good.g 
WHERE i.id=p.idea_id and i=id=g.idea_id
ORDER BY registration_date DESC LIMIT ?, ?;
select idea_id,count(*) from good group by idea_id;

SELECT i.id, i.title, i.writer, i.registration_date, i.state, p.src 
FROM idea i, pictures p,
(select idea_id, count(*) from good group by idea_id) a
select id from comments;
select id from pictures;
select id from idea;

delete from idea where id=24;