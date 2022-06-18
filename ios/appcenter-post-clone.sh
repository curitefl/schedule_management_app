#!/usr/bin/env bash
set -e
set -x

FLUTTER_VERSION="2.10.5"

cd ..
git clone -b ${FLUTTER_VERSION} https://github.com/flutter/flutter.git
export PATH=`pwd`/flutter/bin:$PATH

flutter doctor

echo "Installed flutter to `pwd`/flutter"

flutter build ios --no-codesign