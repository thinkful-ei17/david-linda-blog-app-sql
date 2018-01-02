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

