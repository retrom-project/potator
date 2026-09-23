#!/usr/bin/env bash
set -euo pipefail
root=$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)
cd "$root"
make -C platform/libretro -j4 platform=unix >/dev/null
test -s platform/libretro/potator_libretro.so
nm -D platform/libretro/potator_libretro.so | grep -q ' retro_serialize$'
nm -D platform/libretro/potator_libretro.so | grep -q ' retro_unserialize$'
