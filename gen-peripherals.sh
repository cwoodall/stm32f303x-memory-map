#!/bin/sh

set -ex

main() {
    local svd=resources/STM32F303x.svd

    svd2rust -i $svd > src/lib.rs

    set +e
    rustfmt src/*.rs
    set -e

    xargo build --target thumbv7em-none-eabihf
}

main
