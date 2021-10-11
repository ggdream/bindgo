# BindGo

<div align="center">
    <img src="https://cdn.jsdelivr.net/gh/ggdream/bindgo/doc/logo.jpg" alt="😭" />
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
      cc: 'C:NDK\toolchains\llvm\prebuilt\windows-x86_64\bin\aarch64-linux-android27-clang.cmd'
```

2. Run the following command in the terminal

```bash
flutter pub run bindgo:run
```

## Additional information

View the operating systems and architectures supported by the current version of golang:

```bash
go tool dist list
```

It will output:

e.g. :

<details>
<summary>golang v1.17.2: Support Archs</summary>
```
```
aix/ppc64
android/386
android/amd64
android/arm
android/arm64
darwin/amd64
darwin/arm64
dragonfly/amd64
freebsd/386
freebsd/amd64
freebsd/arm
freebsd/arm64
illumos/amd64
ios/amd64
ios/arm64
js/wasm
linux/386
linux/amd64
linux/arm
linux/arm64
linux/mips
linux/mips64
linux/mips64le
linux/mipsle
linux/ppc64
linux/ppc64le
linux/riscv64
linux/s390x
netbsd/386
netbsd/amd64
netbsd/arm
netbsd/arm64
openbsd/386
openbsd/amd64
openbsd/arm
openbsd/arm64
openbsd/mips64
plan9/386
plan9/amd64
plan9/arm
solaris/amd64
windows/386
windows/amd64
windows/arm
windows/arm64
```
```
</details>
