#!/bin/sh
set -e

flutter clean
flutter packages upgrade
flutter analyze
flutter test
dartfmt -w --set-exit-if-changed lib test

if test -f "example"; then
  cd example
  flutter clean
  flutter packages upgrade
  flutter analyze
  dartfmt -w --set-exit-if-changed lib 
fi
