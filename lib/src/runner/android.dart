import 'package:path/path.dart';

import 'package:bindgo/src/utils/utils.dart';

import 'stub.dart';

class AndroidRunner extends Runner implements Compile {
  AndroidRunner({
    required this.main,
    required this.name,
  });

  final String main;
  final String name;

  @override
  String path = 'android/app/src/main/jniLibs';

  Future<void> run(List<String> archs, [String? cc]) async {
    for (var arch in archs) {
      await runs(
        main: main,
        name: name,
        path: _genPath(arch),
        arch: arch,
        platformType: PlatformType.android,
        cc: cc,
      );
    }
  }

  String _genPath(String arch) {
    late final String folder;
    switch (arch) {
      case 'amd64':
        folder = 'x86_64';
        break;
      case '386':
        folder = 'x86';
        break;
      case 'arm64':
        folder = 'arm-v8a';
        break;
      case 'arm':
        folder = 'armeabi-v7a';
        break;
      default:
        throw 'BindGo: unknown android arch';
    }

    return join(path, folder);
  }
}
