PHONY += spell-init
spell-init: BASENAME := $(shell basename $(CURDIR))
spell-init: ## Init Spell project
	$(call colorecho, "\nInit Spell project...")
	@rsync -av vendor/druidfi/amazeeio-scripts/dist/ .
	@sed -i -e 's|mysite|'"${BASENAME}"'|g' .env
	@mv README.project.md README.md
	@rm LICENSE.md .env-e
	@make self-update
	@git init && git add .
