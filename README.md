# Rust package builder for .deb

> Builds statically linked binaries and packages it as .deb using docker

in your rust crate root dir use it like:

```sh
docker run --rm -it -v $(pwd):/mnt -w /mnt \
  5422m4n/rust-deb-builder \
  cargo deb --target=x86_64-unknown-linux-musl
```

## details

it's based on the official [rust image](https://hub.docker.com/_/rust):

```Dockerfile
FROM rust:latest
RUN apt-get update && \
    apt-get install musl musl-dev musl-tools && \
    rustup target add x86_64-unknown-linux-musl && \
    cargo install cargo-deb
```

## References

- [cargo-deb](https://crates.io/crates/cargo-deb)
- [5422m4n/rust-deb-builder on docker hub](https://hub.docker.com/r/5422m4n/rust-deb-builder)
