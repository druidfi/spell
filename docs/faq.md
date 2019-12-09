# FAQ

## How to access remote instances of a site?

First access your local app container and from there use `drush` to connect:

```
$ make shell
$ drush @alias ssh
```

## How to connect to local database?

Add your database to e.g. Sequel Pro with these instructions:

https://docs.amazee.io/local_docker_development/connect_to_mysql_from_external.html

## How are emails sent?

Emails are sent with SendGrid SMTP configuration using either suitable container or SMTP module.

## Mailhog

Depending of the dev tools you can access Mailhog in:

- https://mailhog.docker.sh/
- http://mailhog.docker.amazee.io/
