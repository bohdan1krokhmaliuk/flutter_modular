## Tools you will need for work with this package
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

### Melos scripts for keeping code clean
```sh
melos test # Runs tests in all packages which have tests
melos test:diff # Runs tests in all changed packages which have tests, enforcing tests for features
melos coverage # Generate and filter coverage data
melos coverage:diff # Generate and filter coverage data for changes
melos coverage:report # Calculate and print report for packages including lcov files
melos coverage:html_report #  Calculate and generate html report for packages including lcov files
melos coverage:clean # Removes all coverage folders and lcov files
melos analyze # Run analyzer in all packages
melos analyze:diff # Run analyzer in changed packages
melos generate # Generate code for all packages
melos generate:clean # Clean and generate code for all packages
melos generate:diff # Clean and generate code for all packages diff with main
melos validate_barrel_file_imports # Runs barrel file imports check (if barrel file was imported inside package instead of its file import)
melos validate_barrel_file_imports:diff # Runs barrel file imports check for all changed packages
melos unused_dependencies # Runs `dependency_validator` in all packages (finds unused dependencies)
melos unused_dependencies:diff # Runs `dependency_validator` in all packages (finds unused dependencies)
melos circular_dependencies # Checks if there is no circular dependencies
melos circular_dependencies:diff # Checks if there is no circular dependencies
melos unused_files # Run `metrics --check-unused-files` in all packages
melos unused_files:diff # Run `metrics --check-unused-files` in all changed packages
melos unused_code # Run `metrics --check-unused-code` in all packages
melos unused_code:diff # Run `metrics --check-unused-code` in all changed packages
melos code_checks # Runs code checks on the project
melos code_checks:diff # Runs code checks on the project diff
melos format # Format all non generated dart files
```