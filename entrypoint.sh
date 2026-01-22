#!/bin/bash -ex

if [ -z "${INPUT_PACKAGE}" ]; then
    PACKAGE=""
else
    PACKAGE="-p ${INPUT_PACKAGE}"
fi

if [ -z "${INPUT_FEATURES}" ]; then
    FEATURES=""
else
    FEATURES="-- --features ${INPUT_FEATURES}"
fi

if [ -z "${INPUT_TARGET}" ]; then
    INPUT_TARGET="x86_64-unknown-linux-musl"
fi

TARGET="--target ${INPUT_TARGET}"
[[ -n "${GITHUB_WORKSPACE}" ]] && cd ${GITHUB_WORKSPACE}

rustc --version
cargo --version
cargo deb --version
cargo deb --verbose ${TARGET} ${PACKAGE} ${FEATURES}
