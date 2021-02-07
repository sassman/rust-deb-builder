image:
	docker build -t 5422m4n/rust-deb-builder .
publish:
	docker push 5422m4n/rust-deb-builder