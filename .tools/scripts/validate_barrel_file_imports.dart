import 'dart:io';

void main() {
  // Melos provides these environment variables during 'melos exec'
  final packageName = Platform.environment['MELOS_PACKAGE_NAME'];

  if (packageName == null) {
    print('❌ MELOS_PACKAGE_NAME not found. Run this via melos.');
    exit(1);
  }

  // The pattern we are looking for: package:my_package/my_package.dart
  final barrelImportPattern = 'package:$packageName/$packageName.dart';
  final exampleDir = 'example';

  final List<String> offendingFiles = [];

  // Recursively list all .dart files
  final files = Directory('.')
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) {
        final path = file.path;
        return path.endsWith('.dart') &&
            !path.contains('.dart_tool/') &&
            !path.contains('$exampleDir/');
      });

  for (final file in files) {
    try {
      final content = file.readAsStringSync();
      if (content.contains(barrelImportPattern)) {
        offendingFiles.add(file.path);
      }
    } catch (e) {
      // Handle potential file access issues gracefully
      continue;
    }
  }

  if (offendingFiles.isNotEmpty) {
    print('❌ Barrel file imports found in the following file(s):');
    for (final path in offendingFiles) {
      print('  - $path');
    }
    print(
      '\n💡 Suggestion: Import specific files instead of the main package barrel.',
    );
    exit(1);
  }

  print('✅ No barrel file imports found in $packageName.');
  exit(0);
}
