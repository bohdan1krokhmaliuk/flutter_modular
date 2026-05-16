import 'dart:io';
import 'ignore_files.dart';

void main(List<String> args) {
  final bool noFail = args.contains('--no-fail');

  final lcovFiles = Directory('.')
      .listSync(recursive: true)
      .whereType<File>()
      .where(
        (f) => f.path.endsWith('lcov.info') && !f.path.contains('.dart_tool'),
      )
      // Exclude root coverage if present
      .where((f) => f.uri.pathSegments.length > 3)
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

    final segments = file.uri.pathSegments;
    final pkgName = segments[segments.length - 3];

    int pkgLF = 0;
    int pkgLH = 0;
    bool skipFile = false;

    for (var line in lines) {
      switch (line.substring(0, 3)) {
        case 'SF:':
          skipFile = ignoreFiles.any(line.endsWith);
        case 'LF:' when !skipFile:
          pkgLF += int.parse(line.split(':').last);
        case 'LH:' when !skipFile:
          pkgLH += int.parse(line.split(':').last);
      }
    }

    if (pkgLF == 0) continue;

    totalLF += pkgLF;
    totalLH += pkgLH;

    final percent = (pkgLH / pkgLF * 100);
    final status = percent >= 80 ? '✅' : '❌';

    buffer.writeln(
      '| $pkgName | ${percent.toStringAsFixed(1)}% | $pkgLH/$pkgLF | $status |',
    );
  }

  final totalPercent = (totalLH / totalLF * 100);
  buffer.writeln(
    '| **TOTAL** | **${totalPercent.toStringAsFixed(1)}%** | **$totalLH/$totalLF** | ${totalPercent >= 80 ? '✅' : '❌'} |',
  );

  print(buffer.toString());

  if (buffer.toString().contains('❌')) {
    if (noFail) {
      print(
        '⚠️ Didn\'t satisfy coverage bounds, but continuing execution because --no-fail was passed.',
      );
      exit(0);
    } else {
      exit(1);
    }
  }
}
