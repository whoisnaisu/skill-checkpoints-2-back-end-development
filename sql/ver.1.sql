-- constraint doesn't work ?

CREATE TABLE users
(
    user_id integer GENERATED ALWAYS AS IDENTITY,
    username varchar(25) UNIQUE NOT NULL,
    password varchar(25)NOT NULL,
    firstname varchar(100) NOT NULL,
    lastname varchar(100)  NOT NULL,
    email varchar(100)  NOT NULL,
    created_at timestamp with time zone NOT NULL,
	constraint users_pkey PRIMARY KEY (user_id)
);


CREATE TABLE categories
(
    category_id integer GENERATED ALWAYS AS IDENTITY,
    name character varying(25)  NOT NULL,
    description character varying(50) COLLATE pg_catalog."default" NOT NULL,
	constraint category_id_key PRIMARY KEY (category_id)
);


CREATE TABLE posts
(
    post_id integer GENERATED ALWAYS AS IDENTITY,
    user_id integer REFERENCES users(user_id) ON DELETE CASCADE,
    post_title text NOT NULL,
    post_context text NOT NULL,

CONSTRAINT posts_category_id_fkey FOREIGN KEY (category_id)
        REFERENCES categories(category_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,

CONSTRAINT posts_post_vote_id_fkey FOREIGN KEY (post_vote_count)
        REFERENCES post_votes(post_vote_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,

CONSTRAINT posts_comment_id_fkey FOREIGN KEY (comment_id)
        REFERENCES comments(comment_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,

  created_at timestamp with time zone NOT NULL,
  updated_at timestamp with time zone NOT NULL,

constraint posts_key PRIMARY KEY (post_id)
);


CREATE TABLE comments
(
	comment_id integer GENERATED ALWAYS AS IDENTITY,
    comment_title character varying(25)  NOT NULL,


CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES users(user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,

CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id)
        REFERENCES posts(post_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,

	comment text not null,


CONSTRAINT comments_comment_vote_id_fkey FOREIGN KEY (comment_vote_count)
        REFERENCES comments(comment_vote_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,

constraint comments_key PRIMARY KEY (comment_id)
);






CREATE TABLE post_votes
(
    post_vote_id integer GENERATED ALWAYS AS IDENTITY,


CONSTRAINT post_votes_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES users(user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,


CONSTRAINT post_votes_post_id_fkey FOREIGN KEY (post_id)
        REFERENCES posts(post_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,

constraint post_vote_id_key PRIMARY KEY (post_vote_id)
);




CREATE TABLE comment_votes
(
    comment_vote_id integer GENERATED ALWAYS AS IDENTITY,
CONSTRAINT comment_votes_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES users(user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,


CONSTRAINT comment_votes_comment_idfkey FOREIGN KEY (comment_id)
        REFERENCES comments(comment_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,

constraint comment_votes_key PRIMARY KEY (comment_vote_id)

);

