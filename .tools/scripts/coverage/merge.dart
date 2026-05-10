import 'dart:io';

void main() {
  final rootDir = Directory.current;
  final masterLcov = File('coverage/lcov.info');

  if (!Directory('coverage').existsSync()) {
    Directory('coverage').createSync();
  }

  final combinedContent = StringBuffer();

  // 1. Find all lcov.info files in sub-packages
  final lcovFiles = rootDir
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => file.path.endsWith('coverage/lcov.info'))
      // Avoid including the master file itself if it already exists
      .where((file) => !file.path.contains('combined_lcov.info'));

  print('Merging ${lcovFiles.length} coverage files...');

  for (final file in lcovFiles) {
    // Get the package path relative to the root (e.g., "packages/auth")
    final packagePath = file.parent.parent.path
        .replaceFirst(rootDir.path, '')
        .replaceFirst(RegExp(r'^[/\\]'), '');

    final lines = file.readAsLinesSync();

    for (var line in lines) {
      if (line.startsWith('SF:')) {
        final filePath = line.substring(3);

        // 2. Fix the path: SF:lib/src/... -> SF:packages/auth/lib/src/...
        // This ensures tools like Sonar or VSCode can find the actual file
        final correctedPath = packagePath.isEmpty
            ? filePath
            : '$packagePath/$filePath';

        combinedContent.writeln('SF:$correctedPath');
      } else {
        combinedContent.writeln(line);
      }
    }
  }

  masterLcov.writeAsStringSync(combinedContent.toString());
  print('✅ Master coverage created at: ${masterLcov.path}');
}
