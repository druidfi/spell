TEST_TARGETS := test-simpletest

PHONY += cast-spell
cast-spell: BASENAME := $(shell basename $(CURDIR))
cast-spell: ## Init Spell project
	$(call step,Init Spell project...\n)
	@sed -i -e 's|mysite|'"${BASENAME}"'|g' .env
ifeq ($(UNAME_S),Darwin)
	@sed -i '' '/composer.lock/d' .gitignore
else
	@sed -i '/composer.lock/d' .gitignore
endif
	@rm -rf .env-e docs LICENSE.md tools/make/project/spell.mk
	$(call step,Check updates for druidfi/tools...\n)
	@$(MAKE) self-update
	@composer config --unset scripts.post-create-project-cmd
	$(call step,Init git...\n)
	@git init --initial-branch=main && git add .
	@$(MAKE) up
	$(call step,Ready. Opening Drupal CMS installer...\n)
	@sleep 5
	@open https://$(BASENAME).docker.so/

PHONY += test-simpletest
test-simpletest: DB_CONTAINER := spell_db
test-simpletest: DB_PORT := 51234
test-simpletest: DB_HOST := 127.0.0.1:$(DB_PORT)
test-simpletest: DRUSH := vendor/bin/drush
test-simpletest: SIMPLETEST_BASE_URL := http://127.0.0.1:8080
test-simpletest: SIMPLETEST_DB := mysql://drupal:drupal@$(DB_HOST)/drupal
test-simpletest: vendor/bin/drush ## Run same tests as in GHA
		$(call step,Start up database...\n)
		@docker stop $(DB_CONTAINER) > /dev/null 2>&1 && docker rm $(DB_CONTAINER) > /dev/null 2>&1 || true
		@docker run --name spell_db -p $(DB_PORT):3306 -d druidfi/mysql:8.0-drupal-lts > /dev/null 2>&1
		@echo "Created. Wait 5 seconds to database to initialize..." && sleep 5
		$(call step,Do site-install...\n)
		@DRUPAL_DB_HOST=$(DB_HOST) $(DRUSH) site-install --yes --quiet minimal && echo "Site is ready."
		$(call step,Run tests...\n)
		@SIMPLETEST_DB=$(SIMPLETEST_DB) DRUPAL_DB_HOST=$(DB_HOST) $(DRUSH) runserver $(SIMPLETEST_BASE_URL) > /dev/null 2>&1 &
		@chromedriver --port=4444 > /dev/null 2>&1 &
		@SIMPLETEST_DB=$(SIMPLETEST_DB) DRUPAL_DB_HOST=$(DB_HOST) SIMPLETEST_BASE_URL=$(SIMPLETEST_BASE_URL) \
			vendor/bin/phpunit -c $(shell pwd)/phpunit.xml.dist --testdox --verbose
		@docker stop $(DB_CONTAINER) > /dev/null 2>&1 && docker rm $(DB_CONTAINER) > /dev/null 2>&1

vendor/bin/drush:
		@composer install -n
