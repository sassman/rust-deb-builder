FROM rust:latest
RUN apt-get update && \
    apt-get install musl musl-dev musl-tools && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    rustup target add x86_64-unknown-linux-musl && \
    cargo install cargo-deb