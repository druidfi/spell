BUILD_TARGETS := dump.sql $(BUILD_TARGETS)
BUILD_TARGETS += conf/keys
DRUPAL_NEW_TARGETS := up build drush-si next-create-user drush-uli

PHONY += start
start: conf/keys
	$(call step,Start up front application...\n)
	$(call node_run,run dev)

dump.sql:
	$(call step,Extract included database dump...\n)
	@gunzip -k dump.sql.gz && echo "Dump file extracted"

conf/keys:
	$(call step,Create oAuth keys...\n)
	@mkdir -p conf/keys
	@openssl genrsa -out conf/keys/private.key 2048
	@openssl rsa -in conf/keys/private.key -pubout > conf/keys/public.key
	@chmod 600 conf/keys/private.key conf/keys/public.key

PHONY += next-create-user
next-create-user:
	$(call step,Create Drupal user for Next.js frontend...\n)
	$(call drush,user:create nextjs)
	$(call drush,user:role:add next_site_previewer nextjs)
