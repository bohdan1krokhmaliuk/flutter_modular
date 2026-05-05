import 'dart:io';

void main() {
  final lcovFiles = Directory('.')
      .listSync(recursive: true)
      .whereType<File>()
      .where(
        (f) => f.path.endsWith('lcov.info') && !f.path.contains('.dart_tool'),
      )
      .toList();

  if (lcovFiles.isEmpty) {
    print('⚠️ No coverage files found. Did you run "melos run coverage:run"?');
    return;
  }

  final buffer = StringBuffer();
  buffer.writeln('\n### 📊 Package Coverage Report');
  buffer.writeln('| Package | Coverage | Lines (Hit/Total) | Status |');
  buffer.writeln('| :--- | :--- | :--- | :--- |');

  int totalLF = 0;
  int totalLH = 0;

  for (var file in lcovFiles) {
    final lines = file.readAsLinesSync();

    // Determine package name from directory structure
    final segments = file.uri.pathSegments;
    final pkgName =
        segments[segments.length - 3]; // .../[pkgName]/coverage/lcov.info

    int pkgLF = 0;
    int pkgLH = 0;
    bool skipFile = false;

    for (var line in lines) {
      switch (line.substring(0, 3)) {
        case 'SF:':
          skipFile = _shouldSkip(line);
        case 'LF:' when !skipFile:
          pkgLF += int.parse(line.split(':').last);
        case 'LH:' when !skipFile:
          pkgLH += int.parse(line.split(':').last);
      }
    }

    if (pkgLF == 0)
      continue; // Skip packages that ended up with 0 lines after filtering

    totalLF += pkgLF;
    totalLH += pkgLH;

    final percent = (pkgLH / pkgLF * 100);
    final status = percent >= 80 ? '✅' : '❌';

    buffer.writeln(
      '| $pkgName | ${percent.toStringAsFixed(1)}% | $pkgLH/$pkgLF | $status |',
    );
  }

  // Add a Grand Total row
  final totalPercent = (totalLH / totalLF * 100);
  buffer.writeln(
    '| **TOTAL** | **${totalPercent.toStringAsFixed(1)}%** | **$totalLH/$totalLF** | ${totalPercent >= 80 ? '✅' : '❌'} |',
  );

  print(buffer.toString());

  // Exit with error if any package (or the total) is below 80%
  if (buffer.toString().contains('❌')) {
    exit(1);
  }
}

bool _shouldSkip(String path) =>
    path.endsWith('.g.dart') ||
    path.endsWith('.freezed.dart') ||
    path.endsWith('.gr.dart') ||
    path.endsWith('.i69n.dart') ||
    path.endsWith('di_module.dart') ||
    path.endsWith('di_initializer.dart') ||
    path.endsWith('.config.dart');
