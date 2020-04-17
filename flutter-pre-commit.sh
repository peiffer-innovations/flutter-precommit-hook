#!/bin/sh
set -e

flutter clean
flutter packages upgrade
flutter analyze
flutter test
if test -f "lib/main.dart"; then
  flutter build aot  
fi
dartfmt -w --set-exit-if-changed lib test

if test -f "example"; then
  cd example
  flutter clean
  flutter packages upgrade
  flutter analyze
  flutter build aot
  dartfmt -w --set-exit-if-changed lib 
fi
