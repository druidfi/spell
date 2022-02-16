TEST_TARGETS := test-simpletest

PHONY += cast-spell
cast-spell: BASENAME := $(shell basename $(CURDIR))
cast-spell: ## Init Spell project
	$(call step,Init Spell project...\n)
ifeq ($(UNAME_S),Darwin)
	@sed -i '' 's/mysite/${BASENAME}/g' .env
	@sed -i '' 's/mysite/${BASENAME}/g' frontend/.env
	@sed -i '' '/composer.lock/d' .gitignore
else
	@sed -i 's/mysite/${BASENAME}/g' .env
	@sed -i 's/mysite/${BASENAME}/g' frontend/.env
	@sed -i '/composer.lock/d' .gitignore
endif
	@rm -rf LICENSE.md README.md tools/make/project/spell.mk
	@mv README.project.md README.md
	@$(MAKE) self-update
	@composer config --unset scripts.post-create-project-cmd
	@git init --initial-branch=main && git add .
	@gzip -dk $(DUMP_SQL_FILENAME).gz

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
		@docker run --name spell_db -p $(DB_PORT):3306 -d druidfi/mariadb:10.5-drupal > /dev/null 2>&1
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

PHONY += create-data
create-data:
	$(call step,Create data...\n)
	$(call drush,user:create frontend --mail="frontend@example.com" --password="s3cr3t")
	$(call drush,user-add-role "next_site_previewer" frontend)
