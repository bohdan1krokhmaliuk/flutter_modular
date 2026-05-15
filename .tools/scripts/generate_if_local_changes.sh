#!/bin/bash

if [ -n "$(git status --porcelain .)" ]; then
  echo "⚙️  Generating code for [$MELOS_PACKAGE_NAME]..."
  dart run build_runner build \
    --delete-conflicting-outputs \
    --build-filter="lib/**" \
    --build-filter="test/**"
else
  echo "⏭️  Skipping [$MELOS_PACKAGE_NAME] (no local changes)"
fi
