-- Create tables for posts, comments, users --

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS comments;
DROP TYPE IF EXISTS tags_options;

CREATE TYPE tags_options AS ENUM (
    'current events',
    'sports',
    'entertainment'
);

CREATE TABLE users (
    id serial PRIMARY KEY,
    first_name text,
    last_name text,
    email_address text NOT NULL,
    screen_name text NOT NULL
);

CREATE TABLE posts (
    id serial PRIMARY KEY,
    author_id integer REFERENCES users ON DELETE RESTRICT,
    title text,
    content_post text,
    published_time timestamp DEFAULT current_timestamp,
    tags tags_options
);

CREATE TABLE comments (
    id serial PRIMARY KEY,
    author_id integer REFERENCES users ON DELETE CASCADE NOT NULL,
    post_id integer REFERENCES posts ON DELETE CASCADE NOT NULL,
    content_comment text
);

-- created 4 users

INSERT INTO users (first_name, last_name, email_address, screen_name) VALUES
('Linda', 'Foo1', 'hello1@yahoo.com', 'lindauser1'),
('David', 'Park1', 'hellopark2@gmail.com', 'daviduser1'),
('Linda', 'Foo2', 'hello2@yahoo.com', 'lindauser2'),
('David', 'Park2', 'hellopark2@gmail.com', 'daviduser2');

--created 2 new posts

INSERT INTO posts (author_id, title, content_post, tags) VALUES
(1, 'First Post', 'This is my first post', 'entertainment'),
(2, 'First Post - david', 'This is my first post - david', 'current events');

--created 3 comments; 2 comments on the first post (2 diff users), 1 comment on the second post
INSERT INTO comments (author_id, post_id, content_comment) VALUES
(1, 1, 'I am comment on my first post'),
(2, 1, 'I am commenting on lindas first post'),
(3, 2, 'I am commenting on davids first post');

