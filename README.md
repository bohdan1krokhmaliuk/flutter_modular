### Install dev tools in order to run melos commands and generate feature packages 
```bash
# Install melos (for handy package base actions only)
dart pub global activate melos
#Allow melos to run scripts
chmod -R +x .tools/scripts

# Install mason (generate new packages)
dart pub global activate mason
dart pub global activate mason_cli

# Install code check utils
dart pub global activate dart_code_metrics
dart pub global activate dependency_validator
```

### Mason bricks for quick package additions 
```sh
mason add -g utility --path .tools/bricks/utility
mason add -g feature --path .tools/bricks/feature
```
After you will be able to add mason extension and with right click on folder insert utility/feature package stub inside