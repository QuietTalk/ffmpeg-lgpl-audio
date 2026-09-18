# FFmpeg LGPL Audio Build

This is a custom build of FFmpeg, distributed under the **GNU Lesser General Public License v2.1 or later** (LGPL-2.1+).

## Build configuration

- Source: https://ffmpeg.org/releases/ffmpeg-8.1.2.tar.xz
- Configure flags: see `build/configure.sh`
- Disabled: `--disable-gpl`, `--disable-nonfree`, `--disable-version3`
- Included codecs: Vorbis, Opus, PCM
- Included muxers: OGG, WAV
- Included filters: loudnorm, aresample, anull, pan

## Source code

The source code for this build is available at:
https://ffmpeg.org/releases/ffmpeg-8.1.2.tar.xz

## License

FFmpeg is licensed under the LGPL-2.1+. See https://www.ffmpeg.org/legal.html for details.

The full text of the LGPL-2.1 license is available at:
https://www.gnu.org/licenses/old-licenses/lgpl-2.1.html

## Modifications

This build is configured with a reduced set of components compared to the
default FFmpeg build. No source code modifications were made.
