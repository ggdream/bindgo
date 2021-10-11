import 'package:bindgo/src/utils/utils.dart';

abstract class Compile {
  late final String path;

  Future<void> run(List<String> archs, [String? cc]);
}

class Runner {
  Future<void> runs({
    required String main,
    required String name,
    required String path,
    required String arch,
    required PlatformType platformType,
    String? cc,
  }) async {
    print('BindGo: ${_getGOOS(platformType)} $arch starting...');

    final Map<String, String> env = {'CGO_ENABLED': '1'};
    _setEnv2Map(arch: arch, platformType: platformType, env: env, cc: cc);

    final cmd = Cmd(env);
    await cmd.run(
      main: main,
      name: name,
      dest: path,
      platform: platformType,
    );

    print('BindGo: ${_getGOOS(platformType)} $arch finished!!!\n');
  }

  void _setEnv2Map({
    required String arch,
    required PlatformType platformType,
    required Map<String, String> env,
    String? cc,
  }) {
    env['GOOS'] = _getGOOS(platformType);

    if (platformType == PlatformType.web) {
      env['GOARCH'] = 'wasm';
    } else {
      env['GOARCH'] = arch;
    }

    if (!(cc == null)) {
      env['CC'] = cc;
    }
  }

  String _getGOOS(PlatformType platformType) {
    switch (platformType) {
      case PlatformType.android:
        return 'android';
      case PlatformType.ios:
        return 'ios';
      case PlatformType.windows:
        return 'windows';
      case PlatformType.macos:
        return 'darwin';
      case PlatformType.linux:
        return 'linux';
      case PlatformType.web:
        return 'js';
      default:
        throw 'the platform is not implemented';
    }
  }
}
