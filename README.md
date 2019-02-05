# druidfi/spell

[![Build Status](https://travis-ci.org/druidfi/spell.svg?branch=master)](https://travis-ci.org/druidfi/spell)

This is a skeleton repository which will create a new Drupal 8 project for you and setup Docker based development
environment by Amazee.io.

After the installation you'll have a directory with our template and with various tools to handle your Drupal 8
codebase.

## Requirements

- PHP and Composer
- [Docker and Pygmy](https://github.com/druidfi/guidelines/blob/master/docs/local_dev_env.md)

## Create a new project

If you have PHP and Composer installed on your host:

```
$ composer create-project druidfi/spell:dev-master YOUR_PROJECT --no-interaction
```

Or using Docker image:

```
mkdir YOUR_PROJECT && cd YOUR_PROJECT && \
docker run --rm -it --user=drupal -v $PWD:/var/www/drupal/public_html \
    druidfi/docker-drupal:php71-basic \
    composer create-project druidfi/spell:dev-master . --no-interaction
```

### Change configuration

Change hostname for your local site in the `YOUR_PROJECT/docker-compose.yml`:

`hostname: &hostname mysite.fi.docker.amazee.io` to `hostname: &hostname yoursite.fi.docker.amazee.io`

Start the development environment, build development codebase and install empty site:

```
$ cd YOUR_PROJECT
$ make new
```

Now your site can can be accessed from http://yoursite.fi.docker.amazee.io

## Next steps

Git has been init in the directory `<project-path>` but you need to specify your remote before you can push.

Also this readme has been replaced with [this one](README.project.md).

## Developing Spell

Testing create-project:

```
$ make test-master
```

This will basically do following command:

`composer create-project druidfi/spell:dev-master /tmp/mysite/master --no-interaction`

## Other information

This project is found from the Packagist: https://packagist.org/packages/druidfi/spell
