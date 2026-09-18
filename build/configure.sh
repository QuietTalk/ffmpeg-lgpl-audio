#!/bin/bash
set -euo pipefail

./configure \
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
  --extra-cflags="${EXTRA_CFLAGS:-}" \
  --extra-ldflags="${EXTRA_LDFLAGS:-}" \
  --enable-libvorbis \
  --enable-libopus \
  --enable-encoder=libvorbis,libopus,pcm_s16le \
  --enable-decoder=pcm_s16le \
  --enable-muxer=ogg,wav \
  --enable-demuxer=pcm_s16le,wav \
  --enable-protocol=file,pipe \
  --enable-filter=loudnorm,aresample,anull,pan \
  --enable-parser=opus,vorbis \
  --enable-bsf=null
