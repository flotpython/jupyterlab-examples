FROM dockerhub.pl.sophia.inria.fr/python-nodejs:latest

USER root

# Install Rust and related tools
ENV DEBIAN_FRONTEND=noninteractive \
    RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH \
    RUST_VERSION=1.95.0

# --- System deps ---
# build-essential + pkg-config + libssl-dev: needed to build evcxr
RUN true \
&& apt-get update \
&& apt-get install -y --no-install-recommends \
    ca-certificates curl \
    build-essential pkg-config libssl-dev \
    cmake git \
&& rm -rf /var/lib/apt/lists/* \
&& true

# --- Rust (pinned), minimal profile = no docs, no rust-src ---
RUN true \
&& curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
    | sh -s -- -y --no-modify-path --profile minimal --default-toolchain ${RUST_VERSION} \
&& true

# --- evcxr REPL + Jupyter kernel ---
# --locked uses each crate's bundled Cargo.lock = reproducible build.
# don't register the evcxr_jupyter kernel here, because
# 1) jupyter is not yet installed at this point, and
# 2) later on we'll run from a venv anyways
# so doing it here would be both ineffective and misleading
# (it would look like the kernel is registered, but it won't actually work)
RUN true \
&& cargo install --locked evcxr_repl evcxr_jupyter \
&& rm -rf "${CARGO_HOME}/registry" "${CARGO_HOME}/git" \
&& true

# utilities
RUN true \
&& cargo install --locked bat eza \
&& true

# Switch to the non-root user
RUN chown -R github-actions:github-actions /home/github-actions
WORKDIR /home/github-actions/project
USER github-actions
