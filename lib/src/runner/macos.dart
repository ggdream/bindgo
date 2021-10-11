import 'package:bindgo/src/utils/platform.dart';

import 'stub.dart';

class MacOSRunner extends Runner implements Compile {
  MacOSRunner({
    required this.main,
    required this.name,
  });

  final String main;
  final String name;

  @override
  String path = 'macos';

  Future<void> run(List<String> archs, [String? cc]) async {
   for (var arch in archs) {
     await runs(
      main: main,
      name: name,
      path: path,
      arch: arch,
      platformType: PlatformType.macos,
      cc: cc,
    );
   }
  }
}
