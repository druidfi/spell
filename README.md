# druidfi/spell

![Drupal](https://github.com/druidfi/spell/workflows/Drupal/badge.svg)

This is a skeleton repository which will create a new Drupal project for you and setup Docker based development
environment with Stonehenge.

## Includes

- Drupal 10.1.x
- Drush 12.x
- Docker Composer setup for development, see [docker-compose.yml](docker-compose.yml)
- [druidfi/tools](https://github.com/druidfi/tools)
- Web root is `./public`
- Configuration is in `./conf/cmi`
- Custom modules can be created in `./public/modules/custom`

## Requirements

- PHP and Composer
- [Docker and Stonehenge](https://druidfi.github.io/guidelines/docs/local_dev_env.html)

## Create a new project

### 1. using Composer

If you have PHP and Composer installed on your host (recommended):

```shell
composer create-project druidfi/spell:dev-main yoursite --no-interaction
```

Or using Docker image:

```shell
mkdir yoursite && cd yoursite && \
docker run --rm -it -v $PWD:/app --env COMPOSER_MEMORY_LIMIT=-1 \
    druidfi/drupal-web:php-8.2 \
    composer create-project druidfi/spell:dev-main . --no-interaction
```

### 2. using GitHub template

Go to https://github.com/druidfi/spell/generate and create your own repository.

When you have cloned your repo, move to `Get Started` section.

## Get started

Now you need to have Stonehenge up & running.

Start the development environment, build development codebase and install empty site with minimal profile:

```shell
make new
```

Now your site can can be accessed from https://yoursite.docker.so

## Next steps

Git has been init in the project, but you need to specify your remote before you can push.

Also this README.md has been replaced with [this one](README.project.md).

You can run `make help` to list all available commands for you.

## Running tests on Spell when developing

On macOS you need first to install Chromedriver and allow it to execute:

```shell
brew install chromedriver
xattr -d com.apple.quarantine /opt/homebrew/bin/chromedriver
```

Then run the same test scenario as in Github Actions:

```shell
make test
```

## Other information

This project can be found from the Packagist: https://packagist.org/packages/druidfi/spell
