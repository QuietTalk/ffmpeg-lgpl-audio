#!/bin/bash
set -euo pipefail

bash ../build/configure.sh
make -j"$(nproc)"
make install DESTDIR="$PWD/install"

cp ffmpeg.exe ../ffmpeg.exe
