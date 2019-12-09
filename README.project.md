# Your Drupal 8 project

Description of your project.

## Environments

Env | Branch | Drush alias | URL
--- | ------ | ----------- | ---
development | * | - | http://yoursite.docker.sh/
production | master | @master | TBD

## Requirements

You need to have these applications installed to operate on all environments:

- [Docker](https://github.com/druidfi/guidelines/blob/master/docs/docker.md)
- [Stonehenge](https://github.com/druidfi/stonehenge)
- For the new person: Your SSH public key needs to be added to servers

## Create and start the environment

For the first time (new project):

```
$ make new
```

And following times to create and start the environment:

```
$ make fresh
```

NOTE: Change these according of the state of your project.

## Login to Drupal container

This will log you inside the app container:

```
$ make shell
```

## Read more

- [FAQ](https://github.com/druidfi/spell/blob/master/docs/faq.md)
- [Project structure](https://github.com/druidfi/spell/blob/master/docs/structure.md)
- [Quality assurance](https://github.com/druidfi/spell/blob/master/docs/qa.md)
- [Recommended contrib modules](https://github.com/druidfi/spell/blob/master/docs/contrib.md)
