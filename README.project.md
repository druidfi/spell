# Your Drupal project

Description of your project.

## Environments

| Env         | Branch | Drush alias | URL                         |
|-------------|--------|-------------|-----------------------------|
| development | *      | -           | https://yoursite.docker.so/ |
| testing     | dev    | @dev        | TBD                         |
| production  | main   | @main       | TBD                         |

## Requirements

You need to have these applications installed to operate on all environments:

- Docker
- [Stonehenge](https://github.com/druidfi/stonehenge)
- [Github CLI](https://cli.github.com/)

## Create and start the environment

For the first time (new project):

```console
make new
```

And following times to create and start the environment:

```console
make fresh
```

NOTE: Change these according to the state of your project.

## Login to Drupal container

This will log you inside the app container:

```console
make shell
```
