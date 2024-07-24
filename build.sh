#!/bin/bash
set -euxo pipefail

# https://github.com/ARM-software/CMSIS/tree/master/CMSIS/Lib/GCC
# https://forum.pjrc.com/index.php?threads/libstdc-exception-handling-__verbose_terminate_handler-causing-bloat-in-output-binary.75084/#post-344661

pio pkg install --storage-dir "$PWD" --tool "platformio/toolchain-gccarmnoneeabi-teensy@^1.110301.0"
wget https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi.tar.xz
tar xvf arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi.tar.xz

mv arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi toolchain-gccarmnoneeabi-teensy-13
cp toolchain-gccarmnoneeabi-teensy/arm-none-eabi/lib/libarm_cortexM7lfsp_math.a toolchain-gccarmnoneeabi-teensy-13/arm-none-eabi/lib

jq '.name += "-13" | .version = "13.3.1" | .description += " using GCC v13.3.rel1" | .repository = "https://github.com/adob/toolchain-gccarmnoneeabi-teensy"' toolchain-gccarmnoneeabi-teensy/package.json > toolchain-gccarmnoneeabi-teensy-13/package.json
