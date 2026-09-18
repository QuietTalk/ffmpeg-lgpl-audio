#!/bin/bash
set -euo pipefail

export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:-}"

bash ../build/configure.sh
make -j"$(nproc)"
make install DESTDIR="$PWD/install"

cp ffmpeg ../ffmpeg
