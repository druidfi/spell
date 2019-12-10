# druidfi/spell

[![Build Status](https://travis-ci.org/druidfi/spell.svg?branch=master)](https://travis-ci.org/druidfi/spell)

This is a skeleton repository which will create a new Drupal 8 project for you and setup Docker based development
environment with Stonehenge.

## Includes

- Drupal 8.8.x
- Drush 10.x
- Docker setup with app image and a database image for development
- [druidfi/tools](https://github.com/druidfi/tools) included

## Requirements

- PHP and Composer
- [Docker and Stonehenge](https://github.com/druidfi/guidelines/blob/master/docs/local_dev_env.md)

## Create a new project

If you have PHP and Composer installed on your host:

```
$ composer create-project druidfi/spell:dev-master yoursite --no-interaction
```

Or using Docker image:

```
mkdir yoursite && cd yoursite && \
docker run --rm -it -v $PWD:/app \
    druidfi/drupal:7.3-web \
    composer create-project druidfi/spell:dev-master . --no-interaction
```

## Get started

Start the development environment, build development codebase and install empty site:

```
$ cd yoursite
$ make new
```

Now your site can can be accessed from https://yoursite.docker.sh

## Next steps

Git has been init in the project but you need to specify your remote before you can push.

Also this README.md has been replaced with [this one](README.project.md).

## Other information

This project is found from the Packagist: https://packagist.org/packages/druidfi/spell
