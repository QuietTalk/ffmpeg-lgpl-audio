# ffmpeg-lgpl-audio

Минимальные LGPL-сборки FFmpeg для кодирования аудио в OGG (Vorbis/Opus) и WAV. Предназначены для клиента [QuietTalk](https://github.com/QuietTalk) — записи речи чанками, нормализации и потоковой передачи.

## Что внутри

Каждая сборка содержит **только `ffmpeg`** (без `ffprobe`, `ffplay` и других бинарников) со следующим набором компонентов:

| Категория | Компоненты |
|---|---|
| **Кодеки (encode)** | `libvorbis`, `libopus`, `pcm_s16le` |
| **Кодеки (decode)** | `pcm_s16le` |
| **Муксеры** | `ogg`, `wav` |
| **Демуксеры** | `wav` |
| **Фильтры** | `loudnorm`, `aresample`, `anull`, `pan` |
| **Протоколы** | `file`, `pipe` |
| **Парсеры** | `opus`, `vorbis` |
| **Bitstream filters** | `null` |

Всё остальное отключено через `--disable-everything`. Итоговый размер бинарника — **~2 МБ** на платформу.

## Лицензия

Сборки распространяются под **LGPL-2.1-or-later**. Флаги `--disable-gpl`, `--disable-nonfree`, `--disable-version3` гарантируют отсутствие GPL-компонентов. Это позволяет использовать бинарники в проприетарных приложениях без обязательства открывать их исходный код.

Исходный код FFmpeg: https://ffmpeg.org/releases/

## Платформы

| Платформа | Архитектура | Файл релиза |
|---|---|---|
| Linux | x86_64 | `ffmpeg-linux-x86_64.tar.gz` |
| Linux | aarch64 | `ffmpeg-linux-aarch64.tar.gz` |
| macOS | x86_64 (Intel) | `ffmpeg-macos-x86_64.tar.gz` |
| macOS | aarch64 (Apple Silicon) | `ffmpeg-macos-aarch64.tar.gz` |
| Windows | x86_64 | `ffmpeg-windows-x86_64.tar.gz` |

## Использование

Скачайте нужный архив из [Releases](../../releases), распакуйте и используйте бинарник:

```bash
# Linux / macOS
tar xzf ffmpeg-linux-x86_64.tar.gz
chmod +x ffmpeg
./ffmpeg -version
```

```powershell
# Windows (PowerShell)
tar xzf ffmpeg-windows-x86_64.tar.gz
.\ffmpeg.exe -version
```

### Пример: запись в OGG/Opus из stdin

```bash
ffmpeg -f s16le -ar 16000 -ac 1 -i pipe:0 \
  -af loudnorm=I=-16:TP=-1.5:LRA=11 \
  -c:a libopus -b:a 32k \
  output.ogg
```

### Пример: запись в OGG/Vorbis

```bash
ffmpeg -f s16le -ar 44100 -ac 1 -i pipe:0 \
  -af loudnorm=I=-16:TP=-1.5:LRA=11 \
  -c:a libvorbis -q:a 4 \
  output.ogg
```

### Пример: запись в WAV

```bash
ffmpeg -f s16le -ar 16000 -ac 1 -i pipe:0 \
  -c:a pcm_s16le \
  output.wav
```

## Проверка лицензии

```bash
ffmpeg -version | head -1
```

В выводе должны быть флаги `--disable-gpl` `--disable-nonfree` `--disable-version3` и **не должно быть** `--enable-gpl`, `--enable-nonfree`, `--enable-version3`.

## Сборка

Сборка автоматизирована через GitHub Actions (`.github/workflows/build.yml`). Запускается по тегу `v*` или вручную через `workflow_dispatch`.

### Локальная сборка

```bash
# 1. Скачать исходники FFmpeg
curl -LO https://ffmpeg.org/releases/ffmpeg-9.0.1.tar.xz
tar xf ffmpeg-9.0.1.tar.xz
cd ffmpeg-9.0.1

# 2. Запустить configure (Linux)
bash ../build/build-linux.sh

# 3. Готовый бинарник — ./ffmpeg
```

### Зависимости

| Платформа | Пакеты |
|---|---|
| Debian/Ubuntu | `build-essential pkg-config yasm nasm libvorbis-dev libopus-dev` |
| macOS (brew) | `pkg-config yasm nasm libvorbis opus` |
| Windows (MSYS2) | `mingw-w64-x86_64-{gcc,pkg-config,yasm,nasm,libvorbis,opus}` |

## Структура репозитория

```
.
├── .github/workflows/build.yml   # CI-сборка для 5 платформ
├── build/
│   ├── configure.sh              # Общие флаги configure
│   ├── build-linux.sh
│   ├── build-macos.sh
│   └── build-windows.sh
├── LICENSE.md                    # LGPL-2.1 и информация о сборке
└── README.md
```

## Обновление версии FFmpeg

1. Измените `FFMPEG_VERSION` в `.github/workflows/build.yml`.
2. Проверьте, что флаги в `build/configure.sh` актуальны (опции FFmpeg меняются между мажорными версиями).
3. Запушьте тег: `git tag v1.0.3` && `git push origin v1.0.3`.
4. Workflow соберёт все платформы и создаст Release.

## Лицензионные обязательства

При распространении этих бинарников в составе своего продукта вы обязаны:

- Указать, что продукт использует FFmpeg под LGPL-2.1+.
- Предоставить ссылку на исходный код используемой версии FFmpeg.
- Включить текст лицензии LGPL-2.1 (см. `LICENSE.md).

FFmpeg является торговой маркой FFmpeg Team. Сборки не аффилированы с FFmpeg Team.
