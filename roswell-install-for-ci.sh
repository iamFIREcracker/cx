#!/usr/bin/env sh

OS_WIN=$(uname -s | grep -e MSYS_NT)

if [ -n "$OS_WIN" ]; then
  curl -L "https://ci.appveyor.com/api/projects/snmsts/roswell-en89n/artifacts/Roswell-x86_64.zip?branch=master&job=Environment%3A%20MSYS2_ARCH%3Dx86_64,%20MSYS2_BITS%3D64,%20MSYSTEM%3DMINGW64,%20METHOD%3Dcross" \
      --output /tmp/roswell.zip
  unzip -n /tmp/roswell.zip -d /tmp/
fi

# Run roswell's CI script, and since it will find `ros` already available
# in $PATH, it would not try to build it but instead will install the specified
# CL implementation + quicklisp
curl -L https://raw.githubusercontent.com/roswell/roswell/release/scripts/install-for-ci.sh | sh