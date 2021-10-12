import 'dart:ffi';
import 'dart:io';

class Loader {
  static DynamicLibrary find(String name, [bool isDLL = true]) {
    if (isDLL) {
      return _findDynamicLinkLibrary(name);
    }

    return DynamicLibrary.process();
  }

  static DynamicLibrary _findDynamicLinkLibrary(String name) {
    final filename = 'lib$name.$_joinDLLSuffix()';
    return DynamicLibrary.open(filename);
  }

  static String _joinDLLSuffix() {
    if (identical(0, 0.0)) {
      return 'wasm';
    } else if (Platform.isAndroid || Platform.isLinux) {
      return 'so';
    } else if (Platform.isIOS || Platform.isMacOS) {
      return 'framework';
    } else if (Platform.isWindows) {
      return 'dll';
    } else {
      throw 'the platform is not implemented';
    }
  }
}
