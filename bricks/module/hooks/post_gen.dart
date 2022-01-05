import 'dart:io';

void main() async {
  /// this also can be recursive
  /// ie: const/example
  List<String> subdirs = [
    "const",
    "models",
    "controllers",
    "repositories",
    "utils",
    "widgets"
  ];
  List<String> createdPaths = [];

  /// - main directory
  await Directory("{{#snakeCase}}{{name}}{{/snakeCase}}").create();

  /// - create all the required components
  for (final subdir in subdirs) {
    final dir = await Directory('{{#snakeCase}}{{name}}{{/snakeCase}}/$subdir')
        .create(recursive: true);
    createdPaths.add(dir.path);
  }
  print('-> create subdirs $createdPaths');
}
