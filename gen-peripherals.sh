#!/bin/sh

set -ex

main() {
    local svd=resources/STM32F303x.svd

    svd2rust -i $svd > src/lib.rs
    sed -i 's/\s*# \[ \([^]]*\) \]/\n#[\1]/g' src/lib.rs
    sed -i 's/\s*# ! \[ \([^]]*\) \]/#![\1]\n/g' src/lib.rs

    set +e
    rustfmt src/*.rs
    set -e

    xargo build --target thumbv7em-none-eabihf
}

main
