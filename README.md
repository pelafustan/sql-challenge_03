# SQL

## Challenge 3

### Context

We have a few tables that model a blog system. There is a table for the users, for the posts, and for the comments.

Their asked us to perform the following:

1. How many records there are?
1. How many subscribers there are? 
1. Which are the oldest records?
1. How many subscriptions are per day? (Regardless the subscription source)
1. How many subscription are per source? 
1. On which day did the most subscriptions happened? How many were?
1. On which day did the most subscriptions happened via Blog? How many were?
1. What was the subscription average per day?
1. On which day the subscriptions were more than 50? 
1. What was the subscription average per day, but starting from the third day? 

### Solution

Well, we solve this questions using the file that you can find on this wonderful repo! The file is called `challenge_03.sql`.

This file will drop any database/table that match any of the used inside the script.

#### How ~~in hell~~ do I run this?

Great question, my fellow friend! I got you covered:

* **First option**: from your shell

```bash
psql -h <hostname> -p <port> -d <database> -U <user> -f /path/to/challenge_02.sql
```

* **Second option**: from within `psql`
```
\i /path/to/challenge_02.sql
```

I'm using docker to run my Postgres server, and I mapped the port `5432` from the container to port `5436` from my machine, so I ran the following
```bash
psql -h localhost -p 5436 -U postgres -d challenge02 -f ./challenge_02.sql
```

TODO:
- Add screenshots.

### Author

* [Patricio Parada](https://github.com/pelafustan)

### Acknowledgement

* Black coffee.
* Green tea (when tummy hurt).
* [Desafío Latam](https://desafiolatam.com/)
