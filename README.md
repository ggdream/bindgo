# BindGo

<div align="center">
    <img src="https://raw.githubusercontent.com/ggdream/bindgo/main/doc/logo.png" alt="😭" />
</div>

<div align="center">
    <a href="https://space.bilibili.com/264346349">
        <img src="https://img.shields.io/badge/bilibili-mocaraka-blueviolet" alt="😭" />
    </a>
    <a href="https://github.com/ggdream/bindgo">
        <img src="https://img.shields.io/badge/GitHub-mocaraka-ff69b4" alt="😭" />
    </a>
</div>
<div align="center">
    <img src="https://img.shields.io/badge/Platforms-Android,iOS,Windows,Linux,MacOS,Web-009688" alt="😭" />
    <img src="https://img.shields.io/badge/Mode-Debug,Profile,Release-3949ab" alt="😭" />
</div>
Use Dart to call Shell, complete the work of compiling Golang CGO code into a so, dll, a, WASM, and etc. And place it in the corresponding source file directory of each Flutter platform.
<br/>
<br/>
<br/>

## Getting started

First, add `bindgo` as a dev dependency in your pubspec.yaml file. It belongs in dev_dependencies because it is a command line tool.

```yaml
dev_dependencies:
  bindgo: any
```

## Usage

1. Adding your config to field `bindgo` in pubspec.yaml

e.g. :

```yaml
bindgo:
  name: test # Dynamic library output name
  main: ./test # The directory where the main package of golang code is located
  platforms:
    windows:
      arch:
        - 'amd64'
    android:
      arch:
        - 'arm64'
      cc: '${NDK}/toolchains/llvm/prebuilt/windows-x86_64/bin/aarch64-linux-android27-clang.cmd'
```

2. Run the following command in the terminal

```bash
dart run bindgo
```

or

```bash
flutter pub run bindgo:run
```

## Additional information

View the operating systems and architectures supported by the current version of golang:

```bash
go tool dist list
```

e.g. :

```bash
# golang v1.17.2

...
android/386
android/amd64
android/arm
android/arm64
---
darwin/amd64
darwin/arm64
...
ios/amd64
ios/arm64
---
js/wasm
---
linux/386
linux/amd64
linux/arm
linux/arm64
...
windows/386
windows/amd64
windows/arm
windows/arm64
```
