# druidfi/spell

![Drupal](https://github.com/druidfi/spell/workflows/Drupal/badge.svg)

This is a skeleton repository which will create a new Drupal project for you and setup Docker based development
environment with Stonehenge.

## Includes

- Drupal 11.1.x (Core and CMS variants)
- Drush 13.x
- Docker Composer setup for development
- [druidfi/tools](https://github.com/druidfi/tools)
- Web root is `./public`
- Configuration is in `./conf/cmi`
- Custom modules can be created in `./public/modules/custom`
- Recipes are in `./recipes`

## Requirements

- PHP ^8.3 and Composer
- [Docker and Stonehenge](https://github.com/druidfi/stonehenge)

## Create a new project

If you have PHP and Composer installed on your host (recommended):

### Drupal core

```console
composer create-project druidfi/spell:dev-core yoursite --no-interaction
```

### Drupal CMS

```console
composer create-project druidfi/spell:dev-cms yoursite --no-interaction
```

Or using Docker image:

### Drupal core

```console
mkdir yoursite && cd yoursite && \
docker run --rm -it -v $PWD:/app --env COMPOSER_MEMORY_LIMIT=-1 \
    druidfi/drupal-web:php-8.3 \
    composer create-project druidfi/spell:dev-core . --no-interaction
```

### Drupal CMS

```console
mkdir yoursite && cd yoursite && \
docker run --rm -it -v $PWD:/app --env COMPOSER_MEMORY_LIMIT=-1 \
    druidfi/drupal-web:php-8.3 \
    composer create-project druidfi/spell:dev-cms . --no-interaction
```

## Get started

Now you need to have Stonehenge up & running.

Start the development environment, build development codebase and install empty site with minimal profile:

```console
make new
```

Now your site can can be accessed from https://yoursite.docker.so

## Next steps

Git has been init in the project, but you need to specify your remote before you can push.

Also, this README.md has been replaced with [this one](README.project.md).

You can run `make help` to list all available commands for you.

## Running tests on Spell when developing

On macOS you need first to install Chromedriver and allow it to execute:

```console
brew install chromedriver
xattr -d com.apple.quarantine /opt/homebrew/bin/chromedriver
```

Then run the same test scenario as in Github Actions:

```console
make test
```

## Other information

This project can be found from the Packagist: https://packagist.org/packages/druidfi/spell
