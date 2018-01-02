-- Create tables for posts, comments, users --


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
    author text REFERENCES users(screen_name),
    title text,
    content_post text,
    published_time timestamp DEFAULT current_timestamp,
    comments integer DEFAULT 0,
    tags tags_options
);

CREATE TABLE comments (
    author text REFERENCES users(screen_name),
    post text REFERENCES posts(id),
    content_comment text
)

-- created 4 users

INSERT INTO users (first_name, last_name, email_address, screen_name) VALUES
('Linda', 'Foo1', 'hello1@yahoo.com', 'lindauser1'),
('David', 'Park1', 'hellopark2@gmail.com', 'daviduser1'),
('Linda', 'Foo2', 'hello2@yahoo.com', 'lindauser2'),
('David', 'Park2', 'hellopark2@gmail.com', 'daviduser2');

--created 2 new posts

INSERT INTO posts (author, title, content_post, comments, tags) VALUES
('lindauser1', 'First Post', 'This is my first post', 3, 'entertainment'),
('daviduser1', 'First Post - david', 'This is my first post - david', 2, 'current events');

--created 3 comments; 2 comments on the first post (2 diff users), 1 comment on the second post
INSERT INTO comments (author, post, content_comment) VALUES
('lindauser1', '1', 'I am comment on my first post'),
('daviduser1', '1', 'I am commenting on lindas first post'),
('lindauser2', '2', 'I am commenting on davids first post');



