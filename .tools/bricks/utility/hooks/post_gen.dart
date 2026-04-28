import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;
import 'package:yaml_edit/yaml_edit.dart';

void run(HookContext context) {
  final root = findRootDir(Directory.current);
  if (root == null) return;

  // 1. Get the package name provided to Mason
  final packageName = context.vars['name'] as String;

  // 2. Get the full path of the NEW package
  // This assumes the package was generated in the current folder
  final String packagePath = p.join(Directory.current.path, packageName);

  // 3. Calculate path relative to the monorepo root
  final String relativePath = p.relative(packagePath, from: root.path);

  final pubspecFile = File(p.join(root.path, 'pubspec.yaml'));
  final editor = YamlEditor(pubspecFile.readAsStringSync());

  try {
    final List currentWorkspace =
        (editor.parseAt(['workspace']).value as List?) ?? [];

    if (!currentWorkspace.contains(relativePath)) {
      // Use the editor to add the specific path
      editor.update(['workspace'], [...currentWorkspace, relativePath]);
      pubspecFile.writeAsStringSync(editor.toString());
      context.logger.info('✅ Added "$relativePath" to workspace.');
    }
  } catch (e) {
    context.logger.err('Could not update root pubspec: $e');
  }
}

Directory? findRootDir(Directory current) {
  if (File(p.join(current.path, 'pubspec.yaml')).existsSync()) {
    final content = File(
      p.join(current.path, 'pubspec.yaml'),
    ).readAsStringSync();
    if (content.contains('workspace:')) return current;
  }
  if (current.path == current.parent.path) return null;
  return findRootDir(current.parent);
}
