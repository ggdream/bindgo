import 'dart:io';

import 'package:yaml/yaml.dart';

class Parser {
  late final dynamic data;

  Parser() {
    final file = File('pubspec.yaml');
    if (!(file.existsSync())) {
      print('BindGo: cannot find pubspec.yaml file here');
      exit(1);
    }

    final Map yamlMap = loadYaml(file.readAsStringSync());
    if (!(yamlMap['bindgo'] is Map)) {
      print('BindGo: config error');
      exit(1);
    }
    this.data = yamlMap['bindgo'];
  }

  String get main => data['main'];

  String get name => data['name'];

  YamlMap get platforms => data['platforms'];
}
