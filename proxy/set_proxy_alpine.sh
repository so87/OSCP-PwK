#!/bin/sh

# install Alpine's "ca-certificates" package
apk add --no-cache ca-certificates openssl; \
# (and "curl" temporarily)
apk add --no-cache --virtual .fetch-deps curl; \
        \
# download necessary certs
dir='/usr/local/share/ca-certificates'; \
for cert in \
	example1.cer \
	example2.cer \
; do \
	curl -fsSL -o "$dir/$cert" \
		"http://example.com/certificate/$cert" \
	; \
# Alpine's "update-ca-certificates" tool expects certs in PEM format
	pem="${cert%.cer}.pem"; \
	openssl x509 -inform der -in "$dir/$cert" -out "$dir/$pem"; \
	rm "$dir/$cert"; \
done; \
	\
# add *.cer files into the global CA store
update-ca-certificates; \
\
# test Google via https to ensure successful CA cert installation and proxy usage
curl -f -o /dev/null https://google.com --verbose



