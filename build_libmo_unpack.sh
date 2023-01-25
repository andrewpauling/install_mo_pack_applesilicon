#!/bin/bash

if [ ! -d libmo_unpack ]; then
    git clone https://github.com/SciTools/libmo_unpack
fi

cd libmo_unpack

export CFLAGS="-Wl,-U,_MO_syslog $CFLAGS"
export CPATH=/opt/homebrew/Cellar/check/0.15.2/include

sed -i '' "s/rt//" tests/CMakeLists.txt
sed -i '' "s|endian.h|machine/endian.h|" src/pack_ppfield.c
sed -i '' "s|endian.h|machine/endian.h|" src/unpack_ppfield.c

mkdir build && cd build

cmake --version
cmake ..

make
make test
sudo make install
