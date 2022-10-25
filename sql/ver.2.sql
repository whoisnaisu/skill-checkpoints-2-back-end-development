CREATE TABLE users (
  user_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  username VARCHAR ( 25 ) UNIQUE NOT NULL,
  password  VARCHAR ( 25 ) NOT NULL,
  firstname VARCHAR ( 100 ) NOT NULL,
  lastname VARCHAR ( 100 ) NOT NULL,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ NOT NULL
);


CREATE TABLE posts (
  post_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  upvote INT NOT NULL DEFAULT 0,
  downvote INT NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ NOT NULL
);

CREATE TABLE comments (
  comment_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  post_id INT REFERENCES posts(post_id) ON DELETE CASCADE,
  user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
  comment TEXT NOT NULL,
  upvote INT NOT NULL DEFAULT 0,
  downvote INT NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ NOT NULL
);

-- HARD CODE

-- add new user

insert into users (username, password, firstname, lastname, created_at, updated_at)
values ('naisu', 'naisupass', 'Naisu', 'Qiu', now(), now());

-- add new posts

insert into posts (user_id, title, context, upvote, downvote, created_at, updated_at)
values (2, 'Title post 2', 'Context post 2', 0, 0, now(), now());