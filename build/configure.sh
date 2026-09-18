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
  --extra-ldflags="-static" \
  --pkg-config-flags="--static" \
  --enable-libvorbis \
  --enable-libopus \
  --enable-encoder=libvorbis,libopus,pcm_s16le \
  --enable-decoder=pcm_s16le \
  --enable-muxer=ogg,wav \
  --enable-demuxer=wav \
  --enable-protocol=file,pipe \
  --enable-filter=loudnorm,aresample,anull,pan \
  --enable-parser=opus,vorbis \
  --enable-bsf=null
