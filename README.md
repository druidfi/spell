# druidfi/spell

![Drupal](https://github.com/druidfi/spell/workflows/Drupal/badge.svg)

This is a skeleton repository which will create a new Drupal 8 project for you and setup Docker based development
environment with Stonehenge.

## Includes

- Drupal 9.0.x
- Drush 10.x
- Docker setup for development, see [docker-compose.yml](docker-compose.yml)
- [druidfi/tools](https://github.com/druidfi/tools)
- Web root is `/public`
- Configuration is in `/conf/cmi`
- Custom modules are created in `/public/modules/custom`
## Requirements

- PHP and Composer
- [Docker and Stonehenge](https://github.com/druidfi/guidelines/blob/master/docs/local_dev_env.md)

## Create a new project

### 1. using Composer

If you have PHP and Composer installed on your host (recommended):

```
$ composer create-project druidfi/spell:dev-main yoursite --no-interaction
```

Or using Docker image:

```
mkdir yoursite && cd yoursite && \
docker run --rm -it -v $PWD:/app --env COMPOSER_MEMORY_LIMIT=-1 \
    druidfi/drupal:7.4-web \
    composer create-project druidfi/spell:dev-main . --no-interaction
```

### 2. using GitHub template

Go to https://github.com/druidfi/spell/generate and create your own repository.

When you have cloned your repo, move to `Get Started` section.

## Get started

Now you need to have Stonehenge up & running.

Start the development environment, build development codebase and install empty site with minimal profile:

```
$ make new
```

Now your site can can be accessed from https://yoursite.docker.sh

## Next steps

Git has been init in the project but you need to specify your remote before you can push.

Also this README.md has been replaced with [this one](README.project.md).

You can run `make help` to list all available commands for you.

## Other information

This project is found from the Packagist: https://packagist.org/packages/druidfi/spell
