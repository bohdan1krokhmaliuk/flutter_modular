** Install dev tools in order to run melos commands and generate feature packages **
```bash
# Install melos (for handy package base actions only)
dart pub global activate melos

# Install mason (generate new packages)
dart pub global activate mason
dart pub global activate mason_cli

# Install code check utils
dart pub global activate dart_code_metrics
dart pub global activate dependency_validator
```