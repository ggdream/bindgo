import 'package:bindgo/src/utils/platform.dart';

import 'stub.dart';

class IOSRunner extends Runner implements Compile {
  IOSRunner({
    required this.main,
    required this.name,
  });

  final String main;
  final String name;

  @override
  String path = 'ios/libs';

  Future<void> run(List<String> archs, [String? cc]) async {
   for (var arch in archs) {
     await runs(
      main: main,
      name: name,
      path: path,
      arch: arch,
      platformType: PlatformType.ios,
      cc: cc,
    );
   }
  }
}
