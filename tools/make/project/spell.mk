PHONY += spell-init
spell-init: BASENAME := $(shell basename $(CURDIR))
spell-init: ## Init Spell project
	$(call colorecho, "\nInit Spell project...")
	@rsync -av vendor/druidfi/amazeeio-scripts/dist/ .
	@sed -i -e 's|mysite|'"${BASENAME}"'|g' .env
ifeq ($(UNAME_S),Darwin)
	@sed -i '' '/composer.lock/d' .gitignore
else
	@sed -i '/composer.lock/d' .gitignore
endif
	@mv README.project.md README.md
	@rm -f LICENSE.md .env-e tools/make/project/spell.mk
	@make self-update
	@git init && git add .
