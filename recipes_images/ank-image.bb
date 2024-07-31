require recipes-core/images/core-image-minimal.bb

IMAGE_INSTALL:append = " \
	ank \
	ank-server \
	ank-agent \
"
