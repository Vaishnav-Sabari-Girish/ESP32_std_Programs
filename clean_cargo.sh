#!/usr/bin/env bash

# -exec runs from the current folder, so it's safe.
# We pass the found path ({}) directly to cargo.
find . -type f -name Cargo.toml -exec cargo +stable clean --manifest-path {} \;
