VERSION:=1.91.1
BASE_IMG_TAG:=${VERSION}-bookworm

build-ci:
	docker buildx build --pull --push --debug \
	    -t 5422m4n/rust-deb-builder:${VERSION} \
	    -t 5422m4n/rust-deb-builder:latest \
		--build-arg VERSION=${VERSION} \
		--build-arg BASE_IMG_TAG=${BASE_IMG_TAG} .

build-local:
	docker buildx build --pull --debug \
	    -t 5422m4n/rust-deb-builder:${VERSION} \
	    -t 5422m4n/rust-deb-builder:latest \
		--build-arg VERSION=${VERSION} \
		--build-arg BASE_IMG_TAG=${BASE_IMG_TAG} .

tag:
	echo deprecated: v1 will cover all
	echo git tag v${VERSION} && git push o v${VERSION}

test:
	docker run --rm -v $(pwd):/mnt -w /mnt 5422m4n/rust-deb-builder:${VERSION}