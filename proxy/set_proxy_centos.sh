#!/bin/bash

# download necessary certs
	for cert in \
		example1.cer \
		example2.cer \
	; do \
		curl -fsSL \
			-o "/etc/pki/ca-trust/source/anchors/$cert" \
			"http://example.com/certificate/$cert" \
		; \
	done; \
	\
# add *.cer files into the global "ca-trust" store
	update-ca-trust force-enable; \
	update-ca-trust extract; \
	\
# test Google via https to ensure successful CA cert installation and proxy usage
	curl -f -o /dev/null https://google.com --verbose


