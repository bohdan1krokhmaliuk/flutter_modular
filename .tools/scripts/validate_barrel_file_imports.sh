# !/bin/bash

flutterExampleFolder=example
files=$(grep -l --exclude-dir=$flutter_example_folder --include *.dart -r package:$MELOS_PACKAGE_NAME/$MELOS_PACKAGE_NAME.dart .)
if [ -n "$files" ]; then
    echo "❌ Barrel file imports found in the following file(s):"
    for f in $files; do
        echo "$f"
    done
    exit 1
else
    exit 0
fi