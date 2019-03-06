PHONY += drush-cex
drush-cex: ## Export configuration
	$(call drush_on_docker,cex -y)

PHONY += drush-cim
drush-cim: ## Import configuration
	$(call colorecho, "\n- Import configuration...\n")
	$(call drush_on_${RUN_ON},cim -y)

PHONY += drush-status
drush-status: ## Show Drupal status information
	$(call drush_on_${RUN_ON},status)

PHONY += drush-uli
drush-uli: ## Get login link
	$(call colorecho, "\n- Login to your site with:\n")
	$(call drush_on_${RUN_ON},uli)

drush-si: ## Site install
	$(call drush_on_${RUN_ON}, -y si --existing-config)

PHONY += drush-updb
drush-updb: ## Run database updates
	$(call colorecho, "\n- Run database updates...\n")
	$(call drush_on_${RUN_ON},updb -y)

PHONY += fresh
fresh: up build sync post-install ## Build fresh development environment and sync

PHONY += new
new: up build drush-si drush-uli ## Create a new empty Drupal installation from configuration

PHONY += post-actions
post-install: drush-updb drush-cim drush-uli ## Run post-install Drush actions

PHONY += sync
sync: ## Sync database and files
	$(call colorecho, "\nSync database from @$(DRUPAL_SYNC_SOURCE)...\n")
	$(call drush_on_${RUN_ON},sql:sync -y @$(DRUPAL_SYNC_SOURCE) @self)
	$(call colorecho, "Sync files from @$(DRUPAL_SYNC_SOURCE)...\n")
	$(call drush_on_${RUN_ON},rsync -y --mode=akzu @$(DRUPAL_SYNC_SOURCE):%files @self:%files)

define drush_on_docker
	$(call call_in_webroot, drush --ansi $(1))
endef

define drush_on_host
	drush --ansi $(1)
endef