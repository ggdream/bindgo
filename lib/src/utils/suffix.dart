import 'platform.dart';

String getSuffix(PlatformType platform) {
  switch (platform) {
    case PlatformType.android:
      return 'so';
    case PlatformType.ios:
      return 'framework';
    case PlatformType.windows:
      return 'dll';
    case PlatformType.macos:
      return 'framework';
    case PlatformType.linux:
      return 'so';
    case PlatformType.web:
      return 'wasm';
    default:
      throw 'the platform is not implemented';
  }
}
