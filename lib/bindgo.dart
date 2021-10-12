library bindgo;

import 'dart:io';

import 'package:yaml/yaml.dart';

import 'package:bindgo/src/runner/runner.dart';
import 'package:bindgo/src/utils/utils.dart';

export 'src/utils/load.dart';

class BindGo {
  BindGo() : _parser = Parser();

  final Parser _parser;

  Future<void> run() async {
    final main = _parser.main;
    final name = _parser.name;

    for (var entry in _parser.platforms.entries) {
      late Compile runner;

      switch (entry.key) {
        case 'android':
          runner = AndroidRunner(main: main, name: name);
          break;
        case 'ios':
          runner = IOSRunner(main: main, name: name);
          break;
        case 'windows':
          runner = WindowsRunner(main: main, name: name);
          break;
        case 'macos':
          runner = MacOSRunner(main: main, name: name);
          break;
        case 'linux':
          runner = LinuxRunner(main: main, name: name);
          break;
        case 'web':
          runner = WebRunner(main: main, name: name);
          break;
        default:
          throw 'BindGo: the platform ${entry.key} is not implemented';
      }

      final archs = entry.value['arch'];
      final cc = entry.value['cc'];
      await runner.run(_handleArch(archs), cc);
    }
  }

  List<String> _handleArch(dynamic archs) {
    switch (archs.runtimeType) {
      case String:
        return [archs];
      case YamlList:
        final List<String> res = [];
        for (var arch in archs) {
          res.add(arch);
        }
        return res;
      default:
        print(archs.runtimeType);
        print('BindGo: arch error');
        exit(1);
    }
  }
}
