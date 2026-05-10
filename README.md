### Install dev tools
```bash
# Install melos (for handy package base actions)
dart pub global activate melos

#Allow melos to run scripts
chmod -R +x .tools/scripts

# Install mason (generate new packages)
dart pub global activate mason
dart pub global activate mason_cli

# Install code check utils
dart pub global activate dart_code_metrics
dart pub global activate dependency_validator

# Install coverage hmtl generator
brew install lcov

# Install recommended vscode extensions
cat .vscode/extensions.json | jq -r '.recommendations[]' | xargs -L 1 code --install-extension
```

### Mason bricks for package generation
```sh
mason add -g utility --path .tools/bricks/utility
mason add -g feature --path .tools/bricks/feature
```
After adding bricks and installing extensions: right click on folder -> "Mason: Make Global Brick" -> create feature or utility 