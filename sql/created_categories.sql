CREATE TABLE post_votes (
post_vote_id INT primary key generated always as identity,
user_id int references users(user_id) on delete cascade,
post_id int references posts(post_id) on delete cascade,
)