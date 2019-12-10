# Recommended contrib modules

- [Admin Toolbar](https://www.drupal.org/project/admin_toolbar) - Improved Drupal Toolbar
- [CDN](https://www.drupal.org/project/cdn) - Easy CDN integration
- [GDPR](https://www.drupal.org/project/gdpr) - GPDR checklist and data sanitizers
- [Pathauto](https://www.drupal.org/project/pathauto) - Automated URL alias generating
- [Swift Mailer](https://www.drupal.org/project/swiftmailer) - Advanced mailer
- [System Status](https://www.drupal.org/project/system_status) - Lumturio monitoring

## Add or remove modules

First log into app container with:

```
$ make shell
```

## Add a new module

Require the new module (e.g. Paragraphs) with:

```
$ composer require drupal/paragraphs
```

## Enable a new module

```
$ drush en paragraphs
```

## Update configuration

```
$ drush cex
```

## Remove a new module

Remove the module (e.g. System status) with:

```
$ composer remove drupal/system_status
```
