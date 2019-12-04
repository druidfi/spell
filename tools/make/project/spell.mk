PHONY += cast-spell
cast-spell: BASENAME := $(shell basename $(CURDIR))
cast-spell: ## Init Spell project
	$(call colorecho, "\nInit Spell project...")
	@sed -i -e 's|mysite|'"${BASENAME}"'|g' .env
ifeq ($(UNAME_S),Darwin)
	@sed -i '' '/composer.lock/d' .gitignore
else
	@sed -i '/composer.lock/d' .gitignore
endif
	@rm -f LICENSE.md README.md tools/make/project/spell.mk
	@mv README.project.md README.md
	@$(MAKE) self-update
	@git init && git add .
	@$(MAKE) new DRUPAL_PROFILE=demo_umami
