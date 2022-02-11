VERSION:=1.58.1

image-m1:
	docker build -t 5422m4n/rust-deb-builder:${VERSION} \
				 -t 5422m4n/rust-deb-builder:latest \
				 --build-arg VERSION=${VERSION} .
image:
	docker build --platform linux/amd64 \
				 -t 5422m4n/rust-deb-builder:${VERSION} \
				 -t 5422m4n/rust-deb-builder:latest \
				 --build-arg VERSION=${VERSION} .
publish:
	docker push 5422m4n/rust-deb-builder:${VERSION}
	docker push 5422m4n/rust-deb-builder:latest
tag:
	echo deprecated: v1 will cover all
	echo git tag v${VERSION} && git push o v${VERSION}
use:
	docker run --rm -v $(pwd):/mnt -w /mnt 5422m4n/rust-deb-builder:${VERSION}