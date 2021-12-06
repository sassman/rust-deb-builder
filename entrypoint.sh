#!/bin/bash -ex

if [ -z "${PACKAGE}" ]; then
    PACKAGE=""
else
    PACKAGE="-p ${PACKAGE}"
fi

if [ -z "${TARGET}" ]; then
    TARGET="x86_64-unknown-linux-musl"
fi

TARGET="--target ${TARGET}"
[[ -n "${GITHUB_WORKSPACE}" ]] && cd ${GITHUB_WORKSPACE}

rustc --version
cargo --version
cargo deb --version
cargo deb --verbose ${TARGET} ${PACKAGE}