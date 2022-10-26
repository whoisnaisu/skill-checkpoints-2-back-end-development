create table comment_votes (
	comment_vote_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	user_id INT NOT NULL,
	comment_id INT NOT NULL,
	upvote INT NOT NULL DEFAULT 0,
	downvote INT NOT NULL DEFAULT 0
);

insert into comment_votes (user_id, comment_id, upvote, downvote) values (13, 64, 1, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (2, 61, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (17, 46, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (15, 93, 1, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (12, 77, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (15, 74, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (14, 80, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (1, 26, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (17, 15, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (10, 72, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (16, 23, 1, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (2, 96, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (19, 84, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (17, 10, 1, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (16, 3, 1, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (4, 37, 1, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (6, 28, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (19, 61, 1, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (20, 26, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (13, 79, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (11, 9, 1, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (11, 5, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (9, 35, 1, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (3, 24, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (13, 19, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (4, 19, 1, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (3, 76, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (1, 57, 1, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (20, 79, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (1, 12, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (3, 49, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (15, 24, 1, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (1, 41, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (2, 100, 1, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (15, 47, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (6, 67, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (19, 14, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (19, 78, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (9, 40, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (6, 85, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (3, 62, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (7, 64, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (19, 85, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (6, 22, 1, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (1, 47, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (20, 1, 1, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (12, 44, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (3, 92, 1, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (8, 87, 1, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (14, 22, 1, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (8, 6, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (9, 74, 1, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (2, 5, 1, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (6, 32, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (19, 28, 1, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (5, 2, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (13, 17, 1, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (16, 100, 1, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (11, 88, 1, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (14, 86, 1, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (13, 40, 1, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (3, 28, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (7, 34, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (15, 19, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (13, 47, 1, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (15, 64, 1, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (5, 18, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (16, 28, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (8, 25, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (15, 47, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (8, 19, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (12, 64, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (6, 21, 1, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (3, 10, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (6, 1, 1, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (5, 56, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (15, 56, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (4, 28, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (20, 31, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (5, 38, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (16, 19, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (12, 64, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (9, 65, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (11, 41, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (12, 18, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (6, 5, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (20, 87, 1, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (9, 76, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (7, 26, 1, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (14, 6, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (14, 89, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (19, 89, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (5, 58, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (13, 53, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (17, 21, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (18, 43, 0, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (4, 31, 0, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (15, 52, 1, 0);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (5, 74, 1, 1);
insert into comment_votes (user_id, comment_id, upvote, downvote) values (5, 78, 0, 0);