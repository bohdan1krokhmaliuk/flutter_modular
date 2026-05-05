#!/bin/bash

# Feature Enforcement 
# Check if the package path contains "feature"
# TODO: all packages must be covered with tests so after utils and other packages covered - enforce everyting
if echo "$MELOS_PACKAGE_PATH" | grep -q "/feature/"; then
  if [ ! -d "test" ]; then
    echo "❌ ERROR: Feature package [$MELOS_PACKAGE_NAME] must have a 'test' directory."
    exit 1
  fi
fi

# 2. Run Test with Coverage
if [ -d "test" ]; then
  echo "🧪 Running tests for [$MELOS_PACKAGE_NAME]..."
  # We use --coverage here so the next script in your pipeline 
  # can pick up the lcov.info files
  flutter test --no-pub --coverage
else
  echo "⏭️  Skipping [$MELOS_PACKAGE_NAME] (No test directory)"
fi