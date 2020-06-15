INSERT INTO developers.user (`id`, `pwd`, `nickname`, `email`, `number`,`date`) VALUES ('admin', '1111', 'mimi', 'gmail', '12345678901','2017-07-23');
INSERT INTO developers.user (`id`, `pwd`, `nickname`, `email`, `number`,`date`) VALUES ('admin2', '2222', 'admin', 'gmail', '12332145678','2017-07-23');
INSERT INTO developers.user (`id`, `pwd`, `nickname`, `email`, `number`,`date`) VALUES ('admin3', 'test', 'test', 'gmail', '12332145678','2017-07-23');
select email from user where id='admin2';
INSERT INTO developers.user_favorite(`user_id`,`web`, `android`, `embeded`, `ios`, `health`, `psychology`,`game`)
VALUES ('admin', '0','0','0','1','0','0','1');
INSERT INTO developers.user_favorite(`user_id`,`web`, `android`, `embeded`, `ios`, `health`, `psychology`,`game`)
VALUES ('admin2', '0','0','0','1','0','0','1');
INSERT INTO developers.user_favorite(`user_id`,`web`, `android`, `embeded`, `ios`, `health`, `psychology`,`game`)
VALUES ('admin3', '0','0','0','1','0','0','1');
select * from participants;
//아이디어는 다섯개씩 만듦
INSERT INTO developers.idea (`writer`, `title`, `content`, `requirements`, `registration_date`, `complete_date`, `number_participants`, `projectURL`, `state`) 
VALUES ('admin', '첫번째아이디어', 'content1', '웹 모집', '2020-06-05', '2020-06-05', '0', 'https://www.naver.com/', '1');
INSERT INTO developers.idea (`writer`, `title`, `content`, `requirements`, `registration_date`, `complete_date`, `number_participants`, `projectURL`, `state`) 
VALUES ('admin2', '두번째아이디어', 'content2', '웹 모집', '2020-06-05', '2020-06-05', '0', 'https://www.naver.com/', '1');
INSERT INTO developers.idea (`writer`, `title`, `content`, `requirements`, `registration_date`, `complete_date`, `number_participants`, `projectURL`, `state`) 
VALUES ('admin3', '세번째아이디어', 'content3', '웹 모집', '2020-06-05', '2020-06-05', '0', 'https://www.naver.com/', '1');
INSERT INTO developers.idea (`writer`, `title`, `content`, `requirements`, `registration_date`, `complete_date`, `number_participants`, `projectURL`, `state`) 
VALUES ('admin3', '네번째아이디어', 'content4', '웹 모집', '2020-06-05', '2020-06-05', '0', 'https://www.naver.com/', '1');
INSERT INTO developers.idea (`writer`, `title`, `content`, `requirements`, `registration_date`, `complete_date`, `number_participants`, `projectURL`, `state`) 
VALUES ('admin3', '다섯번째아이디어', 'content5', '웹 모집', '2020-06-05', '2020-06-05', '0', 'https://www.naver.com/', '1');
select id from idea;
//사진 테이블
delete from pictures;
INSERT INTO developers.pictures(`src`, `idea_id`)
VALUES ('file:///C:/Users/alal3/eclipse-workspace/webServiceProject/Web_TeamPjt/WebContent/upload/Chrysanthemum.jpg', '2');
INSERT INTO developers.pictures(`src`, `idea_id`)
VALUES ('file:///C:/Users/alal3/eclipse-workspace/webServiceProject/Web_TeamPjt/WebContent/upload/Chrysanthemum.jpg', '3');
INSERT INTO developers.pictures(`src`, `idea_id`)
VALUES ('file:///C:/Users/alal3/eclipse-workspace/webServiceProject/Web_TeamPjt/WebContent/upload/Chrysanthemum.jpg', '4');
INSERT INTO developers.pictures(`src`, `idea_id`)
VALUES ('file:///C:/Users/alal3/eclipse-workspace/webServiceProject/Web_TeamPjt/WebContent/upload/Chrysanthemum.jpg', '5');
INSERT INTO developers.pictures(`src`, `idea_id`)
VALUES ('file:///C:/Users/alal3/eclipse-workspace/webServiceProject/Web_TeamPjt/WebContent/upload/Chrysanthemum.jpg', '6');
INSERT INTO developers.pictures(`src`, `idea_id`)
VALUES ('file:///C:/Users/alal3/eclipse-workspace/webServiceProject/Web_TeamPjt/WebContent/upload/Chrysanthemum.jpg', '7');


INSERT INTO developers.idea_favorite(`idea_id`,`web`, `android`, `embeded`, `ios`, `health`, `psychology`,`game`)
VALUES ('2', '0','0','0','1','0','0','1');
INSERT INTO developers.idea_favorite(`idea_id`,`web`, `android`, `embeded`, `ios`, `health`, `psychology`,`game`)
VALUES ('3', '0','0','0','1','0','0','1');
INSERT INTO developers.idea_favorite(`idea_id`,`web`, `android`, `embeded`, `ios`, `health`, `psychology`,`game`)
VALUES ('4', '0','0','0','1','0','0','1');
INSERT INTO developers.idea_favorite(`idea_id`,`web`, `android`, `embeded`, `ios`, `health`, `psychology`,`game`)
VALUES ('5', '0','0','0','1','0','0','1');
INSERT INTO developers.idea_favorite(`idea_id`,`web`, `android`, `embeded`, `ios`, `health`, `psychology`,`game`)
VALUES ('6', '0','0','0','1','0','0','1');
INSERT INTO developers.idea_favorite(`idea_id`,`web`, `android`, `embeded`, `ios`, `health`, `psychology`,`game`)
VALUES ('7', '0','0','0','1','0','0','1');


INSERT INTO developers.participants(`idea_id`,`user_id`, `type`,`Participate_date`)
VALUES ('2', 'admin','0','2020-06-06');
INSERT INTO developers.participants(`idea_id`,`user_id`, `type`,`Participate_date`)
VALUES ('3', 'admin','0','2020-06-07');
INSERT INTO developers.participants(`idea_id`,`user_id`, `type`,`Participate_date`)
VALUES ('4', 'admin2','0','2020-06-07');
INSERT INTO developers.participants(`idea_id`,`user_id`, `type`,`Participate_date`)
VALUES ('5', 'admin3','0','2020-06-07');
INSERT INTO developers.participants(`idea_id`,`user_id`, `type`,`Participate_date`)
VALUES ('6', 'admin3','0','2020-06-07');
INSERT INTO developers.participants(`idea_id`,`user_id`, `type`,`Participate_date`)
VALUES ('7', 'admin3','0','2020-06-07');



INSERT INTO developers.good(`idea_id`,`user_id`, `registration_date`)
VALUES ('11', 'test','2020-06-06');

INSERT INTO developers.good(`idea_id`,`user_id`, `registration_date`)
VALUES ('11', '1','2020-06-06');



delete from participants;