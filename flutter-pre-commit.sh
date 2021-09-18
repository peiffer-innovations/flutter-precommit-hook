#!/bin/sh
set -e

flutter clean
flutter packages upgrade
flutter analyze
flutter test
dart format --set-exit-if-changed lib test

if test -f "example"; then
  cd example
  flutter clean
  flutter packages upgrade
  flutter analyze
  dart format --set-exit-if-changed lib 
fi
