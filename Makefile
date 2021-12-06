VERSION:=1.57.0

image:
	docker build -t 5422m4n/rust-deb-builder:${VERSION} .
publish:
	docker push 5422m4n/rust-deb-builder:${VERSION}
tag:
	git tag v${VERSION} && git push o v${VERSION}
use:
	docker run --rm -v $(pwd):/mnt -w /mnt 5422m4n/rust-deb-builder:${VERSION}