set -ex

main() {
    curl https://sh.rustup.rs -sSf | \
        sh -s -- -y --default-toolchain $TRAVIS_RUST_VERSION

    curl -LSfs https://japaric.github.io/trust/install.sh | \
        sh -s -- \
           --force \
           --git japaric/xargo \
           --tag v0.3.3 \
           --target x86_64-unknown-linux-gnu

    curl -LSfs https://japaric.github.io/trust/install.sh | \
        sh -s -- \
           --force \
           --git japaric/svd2rust \
           --tag v0.5.0 \
           --target x86_64-unknown-linux-gnu

    curl -LSfs https://japaric.github.io/trust/install.sh | \
        sh -s -- \
           --crate rustfmt \
           --force \
           --git japaric/rustfmt-bin \
           --target x86_64-unknown-linux-gnu
}

main
