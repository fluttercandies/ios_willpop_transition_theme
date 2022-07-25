# iOS Willpop Transition Builder

A Flutter package to solve the conflict between ios sliding back and Willpop.

[![pub package](https://img.shields.io/pub/v/ios_willpop_transition_theme?logo=dart&label=stable&style=flat-square)](https://pub.dev/packages/ios_willpop_transition_theme)
[![GitHub stars](https://img.shields.io/github/stars/fluttercandies/ios_willpop_transition_theme?logo=github&style=flat-square)](https://github.com/fluttercandies/ios_willpop_transition_theme/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/fluttercandies/ios_willpop_transition_theme?logo=github&style=flat-square)](https://github.com/fluttercandies/ios_willpop_transition_theme/network/members)
[![CodeFactor](https://img.shields.io/codefactor/grade/github/fluttercandies/ios_willpop_transition_theme?logo=codefactor&logoColor=%23ffffff&style=flat-square)](https://www.codefactor.io/repository/github/fluttercandies/ios_willpop_transition_theme)
<a target="_blank" href="https://jq.qq.com/?_wv=1027&k=5bcc0gy"><img border="0" src="https://pub.idqqimg.com/wpa/images/group.png" alt="FlutterCandies" title="FlutterCandies"></a>


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
                              TargetPlatform.iOS: IosWillpopTransitionsBuilder(),
                              TargetPlatform.android: IosWillpopTransitionsBuilder(),
                              TargetPlatform.macOS: IosWillpopTransitionsBuilder(),
                        },
                  ),
            ),
            home: const Home(),
      );
}
```

<video id="video" controls="" preload="none" poster="preview">
      <source id="mp4" src="https://raw.githubusercontent.com/fluttercandies/ios_willpop_transition_theme/master/preview/pre.mp4" type="video/mp4">
</videos>