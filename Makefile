VERSION:=1.84.0
BASE_IMG_TAG:=${VERSION}-bookworm

image-m1: pull
	docker buildx build --debug -t 5422m4n/rust-deb-builder:${VERSION} \
	    -t 5422m4n/rust-deb-builder:latest \
		--build-arg VERSION=${VERSION} \
		--build-arg BASE_IMG_TAG=${BASE_IMG_TAG} .
image: pull
	docker buildx build --debug --platform linux/amd64 \
		-t 5422m4n/rust-deb-builder:${VERSION} \
		-t 5422m4n/rust-deb-builder:latest \
		--build-arg VERSION=${VERSION} \
		--build-arg BASE_IMG_TAG=${BASE_IMG_TAG} .
pull:
	docker pull rust:${BASE_IMG_TAG}

publish:
	docker push 5422m4n/rust-deb-builder:${VERSION}
	docker push 5422m4n/rust-deb-builder:latest
tag:
	echo deprecated: v1 will cover all
	echo git tag v${VERSION} && git push o v${VERSION}
use:
	docker run --rm -v $(pwd):/mnt -w /mnt 5422m4n/rust-deb-builder:${VERSION}