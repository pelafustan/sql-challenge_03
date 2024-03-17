-- first question
-- setting all the things that we need for the next questions

\c postgres

-- dropping and creating the database
DROP DATABASE IF EXISTS challenge03_patoparada_255;
CREATE DATABASE challenge03_patoparada_255;

\c challenge03_patoparada_255

-- dropping tables if already created
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS comments;

-- I went crazy and I'm using timestamptz for timestamp
SET timezone = 'America/Santiago';

-- needed tables
CREATE TABLE users (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    email VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    role VARCHAR NOT NULL CHECK(role='user' OR role='admin')
);

CREATE TABLE posts (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(50) NOT NULL,
    body TEXT NOT NULL,
    creation_date TIMESTAMPTZ NOT NULL,
    update_date TIMESTAMPTZ,
    featured BOOLEAN NOT NULL,
    user_id BIGINT
);

CREATE TABLE comments (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    body TEXT NOT NULL,
    creation_date TIMESTAMPTZ NOT NULL,
    user_id BIGINT NOT NULL,
    post_id BIGINT NOT NULL
);

-- data insertion
INSERT INTO users (email, first_name, last_name, role)
VALUES
    ('john@example.com', 'John', 'Doe', 'user'),
    ('jane@example.com', 'Jane', 'Smith', 'user'),
    ('alice@example.com', 'Alice', 'Johnson', 'user'),
    ('bob@example.com', 'Bob', 'Brown', 'admin'),
    ('sam@example.com', 'Sam', 'Taylor', 'user');

INSERT INTO posts (title, body, creation_date, update_date, featured, user_id)
VALUES
    (
        'Code of conduct',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis vehicula metus. Integer dignissim velit ut metus commodo tempus. Nullam a purus quam. Etiam elementum justo ligula. Sed sodales blandit arcu vitae blandit. Curabitur feugiat, nibh et porttitor finibus, est turpis sollicitudin sapien, a imperdiet odio justo ac diam. Donec non est et lorem feugiat suscipit vel nec enim. Vivamus sit amet feugiat dolor, sed aliquet tortor. Curabitur eget erat purus. Nulla facilisi. Maecenas mattis lorem sed risus pellentesque tempus. Nam id rhoncus dui. Curabitur quis est lectus. Aenean nec nunc ut risus venenatis tincidunt pretium eu ligula. Proin ultrices semper erat at consequat. Aliquam erat volutpat.',
        '2022-03-15 14:21:13-03',
        '2022-08-21 10:22:59-04',
        TRUE,
        4
    ),
    (
        'Usage Policy',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis vehicula metus. Integer dignissim velit ut metus commodo tempus. Nullam a purus quam. Etiam elementum justo ligula. Sed sodales blandit arcu vitae blandit. Curabitur feugiat, nibh et porttitor finibus, est turpis sollicitudin sapien, a imperdiet odio justo ac diam. Donec non est et lorem feugiat suscipit vel nec enim. Vivamus sit amet feugiat dolor, sed aliquet tortor. Curabitur eget erat purus. Nulla facilisi. Maecenas mattis lorem sed risus pellentesque tempus. Nam id rhoncus dui. Curabitur quis est lectus. Aenean nec nunc ut risus venenatis tincidunt pretium eu ligula. Proin ultrices semper erat at consequat. Aliquam erat volutpat.',
        '2022-03-16 09:50:21-03',
        NULL,
        TRUE,
        4
    ),
    (
        'The Twilight of the Gods',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis vehicula metus. Integer dignissim velit ut metus commodo tempus. Nullam a purus quam. Etiam elementum justo ligula. Sed sodales blandit arcu vitae blandit. Curabitur feugiat, nibh et porttitor finibus, est turpis sollicitudin sapien, a imperdiet odio justo ac diam. Donec non est et lorem feugiat suscipit vel nec enim. Vivamus sit amet feugiat dolor, sed aliquet tortor. Curabitur eget erat purus. Nulla facilisi. Maecenas mattis lorem sed risus pellentesque tempus. Nam id rhoncus dui. Curabitur quis est lectus. Aenean nec nunc ut risus venenatis tincidunt pretium eu ligula. Proin ultrices semper erat at consequat. Aliquam erat volutpat.',
        '2022-06-16 23:20:12-04',
        '2022-07-01 14:23:32-04',
        FALSE,
        5
    ),
    (
        'Brünnhilde and the Ride of the Valkyries',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis vehicula metus. Integer dignissim velit ut metus commodo tempus. Nullam a purus quam. Etiam elementum justo ligula. Sed sodales blandit arcu vitae blandit. Curabitur feugiat, nibh et porttitor finibus, est turpis sollicitudin sapien, a imperdiet odio justo ac diam. Donec non est et lorem feugiat suscipit vel nec enim. Vivamus sit amet feugiat dolor, sed aliquet tortor. Curabitur eget erat purus. Nulla facilisi. Maecenas mattis lorem sed risus pellentesque tempus. Nam id rhoncus dui. Curabitur quis est lectus. Aenean nec nunc ut risus venenatis tincidunt pretium eu ligula. Proin ultrices semper erat at consequat. Aliquam erat volutpat.',
        '2022-06-16 12:12:47-04',
        NULL,
        FALSE,
        3
    ),
    (
        'Siegfried or the Pursuit of Fear',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi quis vehicula metus. Integer dignissim velit ut metus commodo tempus. Nullam a purus quam. Etiam elementum justo ligula. Sed sodales blandit arcu vitae blandit. Curabitur feugiat, nibh et porttitor finibus, est turpis sollicitudin sapien, a imperdiet odio justo ac diam. Donec non est et lorem feugiat suscipit vel nec enim. Vivamus sit amet feugiat dolor, sed aliquet tortor. Curabitur eget erat purus. Nulla facilisi. Maecenas mattis lorem sed risus pellentesque tempus. Nam id rhoncus dui. Curabitur quis est lectus. Aenean nec nunc ut risus venenatis tincidunt pretium eu ligula. Proin ultrices semper erat at consequat. Aliquam erat volutpat.',
        '2023-12-07 02:15:05-03',
        '2023-12-07 17:21:27-03',
        FALSE,
        17
    );

INSERT INTO comments (body, creation_date, user_id, post_id)
VALUES
    (
        'Suspendisse tincidunt, risus sed interdum consequat, ante nisi lacinia risus, eget pharetra neque nunc a nisl. Proin quis diam sit amet urna congue dapibus sed sit amet lectus. Vestibulum erat magna, vehicula sed hendrerit in, tincidunt ut nisl. Suspendisse at semper mi, non pellentesque odio. Nunc tempor massa sit amet enim ultricies, quis maximus ligula bibendum. Duis aliquet ornare est, eget porta turpis sollicitudin eu. Aenean ornare fermentum pretium.',
        '2022-05-03 15:10:47-04',
        1,
        1
    ),
    (
        'Suspendisse tincidunt, risus sed interdum consequat, ante nisi lacinia risus, eget pharetra neque nunc a nisl. Proin quis diam sit amet urna congue dapibus sed sit amet lectus. Vestibulum erat magna, vehicula sed hendrerit in, tincidunt ut nisl. Suspendisse at semper mi, non pellentesque odio. Nunc tempor massa sit amet enim ultricies, quis maximus ligula bibendum. Duis aliquet ornare est, eget porta turpis sollicitudin eu. Aenean ornare fermentum pretium.',
        '2022-05-03 15:45:20-04',
        2,
        1
    ),
    (
        'Suspendisse tincidunt, risus sed interdum consequat, ante nisi lacinia risus, eget pharetra neque nunc a nisl. Proin quis diam sit amet urna congue dapibus sed sit amet lectus. Vestibulum erat magna, vehicula sed hendrerit in, tincidunt ut nisl. Suspendisse at semper mi, non pellentesque odio. Nunc tempor massa sit amet enim ultricies, quis maximus ligula bibendum. Duis aliquet ornare est, eget porta turpis sollicitudin eu. Aenean ornare fermentum pretium.',
        '2022-05-03 16:21:13-04',
        3,
        1
    ),
    (
        'Suspendisse tincidunt, risus sed interdum consequat, ante nisi lacinia risus, eget pharetra neque nunc a nisl. Proin quis diam sit amet urna congue dapibus sed sit amet lectus. Vestibulum erat magna, vehicula sed hendrerit in, tincidunt ut nisl. Suspendisse at semper mi, non pellentesque odio. Nunc tempor massa sit amet enim ultricies, quis maximus ligula bibendum. Duis aliquet ornare est, eget porta turpis sollicitudin eu. Aenean ornare fermentum pretium.',
        '2022-09-07 11:00:15-04',
        1,
        2
    ),
    (
        'Suspendisse tincidunt, risus sed interdum consequat, ante nisi lacinia risus, eget pharetra neque nunc a nisl. Proin quis diam sit amet urna congue dapibus sed sit amet lectus. Vestibulum erat magna, vehicula sed hendrerit in, tincidunt ut nisl. Suspendisse at semper mi, non pellentesque odio. Nunc tempor massa sit amet enim ultricies, quis maximus ligula bibendum. Duis aliquet ornare est, eget porta turpis sollicitudin eu. Aenean ornare fermentum pretium.',
        '2022-10-17 13:11:34-04',
        2,
        2
    );

-- second question
SELECT users.first_name, users.last_name, users.email, posts.title, posts.body
FROM users, posts
WHERE users.id = posts.user_id;

-- third question
SELECT posts.id, posts.title, posts.body
FROM posts
INNER JOIN users
ON posts.user_id = users.id
WHERE users.role = 'admin';

-- fourth question
SELECT users.id, users.email, COUNT(posts.id) AS post_count
FROM users
LEFT JOIN posts
ON users.id = posts.user_id
GROUP BY users.id, users.email
ORDER BY users.id;

-- fifth question
WITH temp_table AS (
    SELECT users.email AS user_email, COUNT(posts.id) AS post_count
    FROM users
    LEFT JOIN posts
    ON users.id = posts.user_id
    GROUP BY users.email
)
SELECT user_email AS user_with_more_posts
FROM temp_table
WHERE post_count = (SELECT MAX(post_count) FROM temp_table);

-- sixth question
SELECT users.email, MAX(posts.creation_date) AS last_post_date
FROM users
LEFT JOIN posts ON users.id = posts.user_id
GROUP BY users.email;

-- seventh question
WITH temp_table AS (
    SELECT posts.title AS title, posts.body AS body, COUNT(comments.id) as comment_count
    FROM posts
    LEFT JOIN comments
    ON posts.id = comments.post_id
    GROUP BY posts.title, posts.body
)
SELECT title, body, comment_count
FROM temp_table
WHERE comment_count = (SELECT MAX(comment_count) FROM temp_table);

-- eighth question
SELECT
    posts.title AS post_title,
    posts.body AS post_body,
    comments.body AS comment_body,
    users.email AS email
FROM posts
INNER JOIN comments
ON posts.id = comments.post_id
LEFT JOIN users
ON posts.user_id = users.id;

-- ninth question
SELECT users.email, MAX(comments.creation_date) as last_comment_date
FROM users
LEFT JOIN comments ON users.id = comments.user_id
GROUP BY users.email

-- tenth question
SELECT users.email FROM users
LEFT JOIN comments
ON users.id = comments.user_id
WHERE comments.id IS NULL;
