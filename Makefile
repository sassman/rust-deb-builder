VERSION:=1.58.1

image:
	docker build -t 5422m4n/rust-deb-builder:${VERSION} \
				 -t 5422m4n/rust-deb-builder:latest \
				 --build-arg VERSION=${VERSION} .
publish:
	docker push 5422m4n/rust-deb-builder:${VERSION}
	docker push 5422m4n/rust-deb-builder:latest
tag:
	git tag v${VERSION} && git push o v${VERSION}
use:
	docker run --rm -v $(pwd):/mnt -w /mnt 5422m4n/rust-deb-builder:${VERSION}