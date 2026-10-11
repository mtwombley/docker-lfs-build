#!/bin/bash
set -e
echo "Building binutils.."
echo "Approximate build time: 1 SBU"
echo "Required disk space: 691 MB"

# 5.4 Binutils package contains a linker, an assembler, and other
#  tools for handling object files
tar -xf /sources/binutils-*.tar.xz -C /tmp/ \
  && mv /tmp/binutils-* /tmp/binutils \
  && pushd /tmp/binutils \
  && mkdir -v build \
  && cd build \
  && ../configure                   \
    --prefix=/tools                 \
    --with-sysroot=$LFS             \
    --target=$LFS_TGT               \
    --disable-nls                   \
    --enable-gprofng=no             \
    --disable-werror                \
    --enable-new-dtags              \
    --enable-default-hash-style=gnu \
    --with-lib-path=/tools/lib      \
  && make \
  && mkdir -pv /tools/lib \
  && ln -sv lib /tools/lib64 \
  && make install \
  && popd \
  && rm -rf /tmp/binutils
