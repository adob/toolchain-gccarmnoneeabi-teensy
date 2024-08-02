#!/bin/bash

set -euxo pipefail

url="https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi.tar.xz"

echo "Downloading $url..."
curl -L "$url" | tar -xJf - --strip-components=1

echo "Downloading toolchain-gccarmnoneeabi-teensy..."
pio pkg install --storage-dir "$PWD" --tool "platformio/toolchain-gccarmnoneeabi-teensy@^1.110301.0"

echo "Installing libarm_cortexM7lfsp_math.a..."
cp toolchain-gccarmnoneeabi-teensy/arm-none-eabi/lib/libarm_cortexM7lfsp_math.a arm-none-eabi/lib

echo "Cleaning up..."
rm -r toolchain-gccarmnoneeabi-teensy
