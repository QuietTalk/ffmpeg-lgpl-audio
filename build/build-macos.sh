#!/bin/bash
set -euo pipefail

export PKG_CONFIG_PATH="$(brew --prefix)/lib/pkgconfig:${PKG_CONFIG_PATH:-}"

bash ../build/configure.sh
make -j"$(sysctl -n hw.ncpu)"
make install DESTDIR="$PWD/install"

cp ffmpeg ../ffmpeg
