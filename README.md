# iOS Willpop Transition Builder

A Flutter package to solve the conflict between ios sliding back and Willpop.

related issue: [#14203](https://github.com/flutter/flutter/issues/14203)

[![pub package](https://img.shields.io/pub/v/ios_willpop_transition_theme?logo=dart&label=stable&style=flat-square)](https://pub.dev/packages/ios_willpop_transition_theme)
[![GitHub stars](https://img.shields.io/github/stars/fluttercandies/ios_willpop_transition_theme?logo=github&style=flat-square)](https://github.com/fluttercandies/ios_willpop_transition_theme/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/fluttercandies/ios_willpop_transition_theme?logo=github&style=flat-square)](https://github.com/fluttercandies/ios_willpop_transition_theme/network/members)
<a target="_blank" href="https://jq.qq.com/?_wv=1027&k=5bcc0gy"><img border="0" src="https://pub.idqqimg.com/wpa/images/group.png" alt="FlutterCandies" title="FlutterCandies"></a>

## 1. Take effect globally
Override `builders` of `PageTransitionsTheme`

```dart
@override
Widget build(BuildContext context) {
      return MaterialApp(
            title: 'Flutter Example',
            theme: ThemeData(
                  /// Set as needed
                  pageTransitionsTheme: const PageTransitionsTheme(
                        builders: {
                              TargetPlatform.iOS: IOSWillPopTransitionsBuilder(),
                              TargetPlatform.android: IOSWillPopTransitionsBuilder(),
                              TargetPlatform.macOS: IOSWillPopTransitionsBuilder(),
                        },
                  ),
            ),
            home: const Home(),
      );
}
```

## 2. Local effect
Use `WillPopPageRoute`

```dart
Navigator.of(context).push(WillPopPageRoute(
      builder: (_) => const TestPage(),
));
```

<img src="https://raw.githubusercontent.com/fluttercandies/ios_willpop_transition_theme/main/preview/pre.gif" height=400>