#!/bin/bash
# Formats non-generated Dart files in the current package directory.
# Designed to be invoked by melos exec — the cwd must be a package root.
find . \
  \( -path "*/build" -o -path "*/.dart_tool" \) -prune \
  -o -name "*.dart" \
  -not -name "*.freezed.dart" \
  -not -name "*.g.dart" \
  -not -name "*.config.dart" \
  -not -name "*.gr.dart" \
  -not -name "*.gen.dart" \
  -not -name "*.i69n.dart" \
  -not -path "*/test/feature/*_test.dart" \
  -print | xargs dart format > /dev/null
