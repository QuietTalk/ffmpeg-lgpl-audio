#!/bin/bash
set -euo pipefail

export PKG_CONFIG_PATH="$(brew --prefix)/lib/pkgconfig:${PKG_CONFIG_PATH:-}"

SDK_PATH="$(xcrun --sdk macosx --show-sdk-path)"

export EXTRA_CFLAGS="--sysroot=$SDK_PATH"
export EXTRA_LDFLAGS=""

./configure \
  --cc=clang \
  --disable-everything \
  --disable-autodetect \
  --disable-doc \
  --disable-htmlpages \
  --disable-manpages \
  --disable-podpages \
  --disable-txtpages \
  --disable-debug \
  --disable-gpl \
  --disable-nonfree \
  --disable-version3 \
  --enable-static \
  --disable-shared \
  --enable-small \
  --pkg-config-flags="--static" \
  --extra-cflags="$EXTRA_CFLAGS" \
  --enable-libvorbis \
  --enable-libopus \
  --enable-encoder=libvorbis,libopus,pcm_s16le \
  --enable-decoder=pcm_s16le \
  --enable-muxer=ogg,wav \
  --enable-demuxer=s16le,wav \
  --enable-protocol=file,pipe \
  --enable-filter=loudnorm,aresample,anull,pan \
  --enable-parser=opus,vorbis \
  --enable-bsf=null

make -j"$(sysctl -n hw.ncpu)"
make install DESTDIR="$PWD/install"

cp ffmpeg ../ffmpeg
