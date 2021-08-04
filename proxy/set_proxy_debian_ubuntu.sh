#!/bin/sh

# install Debian's "ca-certificates" and "openssl" packages
# (and "wget" temporarily)
	apt-get update -y; \
	apt-get install --no-install-recommends \
		ca-certificates\
		openssl \
		wget \
	-y; \
	\
# download necessary certs
	dir='/usr/local/share/ca-certificates'; \
	for cert in \
		example1.cer \
		example2.cer \
	; do \
		wget -qO "$dir/$cert" \
			"http://example.com/certificate/$cert" \
		; \
# Debian's "update-ca-certificates" tool expects certs in PEM format
		pem="${cert%.cer}.crt"; \
		openssl x509 -inform der -in "$dir/$cert" -out "$dir/$pem"; \
		rm "$dir/$cert"; \
	done; \
	\
# add *.cer files into the global CA store
	update-ca-certificates; \
	\
# test Google via https to ensure successful CA cert installation and proxy usage
	wget -O /dev/null https://google.com


