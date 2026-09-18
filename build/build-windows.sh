#!/bin/bash
set -euo pipefail

export EXTRA_LDFLAGS="-static"
export EXTRA_CFLAGS=""

bash ../build/configure.sh
make -j"$(nproc)"
make install DESTDIR="$PWD/install"

cp ffmpeg.exe ../ffmpeg.exe
