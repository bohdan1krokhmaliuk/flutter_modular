import 'dart:io';
import 'ignore_files.dart';

void main(List<String> args) {
  final file = File('coverage/lcov.info');

  if (!file.existsSync()) {
    print('Error: coverage/lcov.info not found.');
    exit(1);
  }

  final lines = file.readAsLinesSync();
  final filteredLines = <String>[];

  bool skipCurrentFile = false;

  for (final line in lines) {
    if (line.startsWith('SF:')) {
      skipCurrentFile = ignoreFiles.any((p) => line.contains(p));
    }

    if (!skipCurrentFile) {
      filteredLines.add(line);
    }

    if (line == 'end_of_record') {
      skipCurrentFile = false;
    }
  }

  file.writeAsStringSync(filteredLines.join('\n'));
  print('Successfully filtered coverage/lcov.info');
}
