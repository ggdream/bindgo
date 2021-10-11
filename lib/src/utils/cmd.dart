import 'dart:io';

import 'package:path/path.dart';
import 'package:process_run/shell_run.dart';

import 'platform.dart';
import 'suffix.dart';

class Cmd {
  Cmd(Map<String, String> env)
      : _shell = Shell(
          environment: env,
          verbose: false,
        );

  final Shell _shell;

  Future<void> run({
    required String main,
    required String name,
    required String dest,
    required PlatformType platform,
  }) async {
    final suffix = getSuffix(platform);
    final file = join(Directory.current.path, dest, 'lib$name.$suffix');

    await _shell
        .run("go build -buildmode=c-shared -ldflags '-s -w' -o $file $main");
    // print(res[0].stdout.toString());
    // print(res[0].stderr.toString());
  }
}
