# Rust package builder for .deb (`x86_64-unknown-linux-musl`)

> Builds statically linked binaries and packages it as .deb using docker

## Usage via GitHub actions

```yaml
name: Build statically linked .deb package

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: build .deb file
      uses: sassman/rust-deb-builder@v1
```

### Parameters

- `package`: the package name, in case your crate as multiple bin targets
- `target`: default: `x86_64-unknown-linux-musl`

## Usage via docker

in your rust crate root dir use it like:

```sh
# run this in your crate root where the `Cargo.toml` is located
docker run --rm -v $(pwd):/mnt -w /mnt 5422m4n/rust-deb-builder:latest
```

## details

it's based on the official [rust image](https://hub.docker.com/_/rust):

## References

- [cargo-deb](https://crates.io/crates/cargo-deb)
- [5422m4n/rust-deb-builder on docker hub](https://hub.docker.com/r/5422m4n/rust-deb-builder)
