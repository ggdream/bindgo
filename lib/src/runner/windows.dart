import 'dart:io';

import 'package:bindgo/src/utils/utils.dart';
import 'package:path/path.dart';

import 'stub.dart';

class WindowsRunner extends Runner implements Compile {
  WindowsRunner({
    required this.main,
    required this.name,
  });

  final String main;
  final String name;

  @override
  String path = 'windows';

  Future<void> run(List<String> archs, [String? cc]) async {
    for (var arch in archs) {
      await runs(
        main: main,
        name: name,
        path: path,
        arch: arch,
        platformType: PlatformType.windows,
        cc: cc,
      );
    }

    await _fileAppend();
  }

  Future<void> _fileAppend() async {
    final filepath = join(Directory.current.path, path, 'CMakeLists.txt');
    final file = File(filepath);

    final data =
        '''\ninstall(TARGETS \${PROJECT_SOURCE_DIR}/lib$name.${getSuffix(PlatformType.windows)} RUNTIME DESTINATION "\${CMAKE_INSTALL_PREFIX}"
  COMPONENT Runtime)\n''';

    final content = await file.readAsString();
    final match = content.indexOf(data);
    if (match != -1) return;

    await file.writeAsString(data, mode: FileMode.append, flush: true);
  }
}
