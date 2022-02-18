BUILD_TARGETS := conf/keys

PHONY += front-run
front-run: conf/keys
		$(call step,Start up front application...\n)
		$(call node_run,run dev)

conf/keys:
		$(call step,Create oAuth keys...\n)
		@mkdir -p conf/keys
		@openssl genrsa -out conf/keys/private.key 2048
		@openssl rsa -in conf/keys/private.key -pubout > conf/keys/public.key
